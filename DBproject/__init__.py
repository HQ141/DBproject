import mysql.connector
import docker
from flask import Flask,request,render_template,g
app=Flask(__name__)
def get_columns(tname):
	mydb=connect_db()
	conn =mydb.cursor()
	conn.execute(f"Show columns FROM {tname}")
	colname=conn.fetchall()
	mydb.close()
	return colname
def connect_db():
	client=docker.DockerClient()
	container=client.containers.get("db-docker_mysql-development_1")
	ip_ad=container.attrs['NetworkSettings']['IPAddress']
	mydb=mysql.connector.connect(
		host=ip_ad,
		user="guest",
		password="qwerty",
		database="DB_project",
		port=3306,
		auth_plugin='mysql_native_password'
	)
	return mydb

@app.errorhandler(404)
def not_found(e):
	return render_template("404.html")


@app.route("/update",methods=['POST','GET'])
def update():
	if request.method=='GET':
		return render_template('update.html')
	if request.method=='POST':
		mydb=connect_db()
		conn=mydb.cursor()
		conn.execute(f"Update organization set headquaters= '{request.form['location']}' where organization_id={request.form['id']};")
		mydb.commit()
		mydb.close()
		return display('organization')
@app.route("/delete",methods=['POST','GET'])
def delete():
	if request.method=='GET':
		return render_template('delete.html')
	if request.method=='POST':
		mydb=connect_db()
		conn=mydb.cursor()
		print(f"Delete from organization where organization_id={request.form['id']};")
		conn.execute(f"Delete from organization where organization_id={request.form['id']};")
		mydb.commit()
		mydb.close()
		return display('organization')

@app.route("/insert/<tname>",methods=['GET','POST'])
def insert(tname):
	if(request.method=="GET"):
		colname=get_columns(tname)
		return render_template("insert.html",my_list=colname,tname=tname)
	else:
		mydb=connect_db()
		conn =mydb.cursor()
		conn.execute(f"Show columns FROM {tname}")
		colname=conn.fetchall()
		sql_query=f'insert into {tname}('
		temp=') values ('
		for i in colname:
			sql_query=sql_query + " " +f"{i[0]},"
			temp=temp+f"'{request.form[i[0]]}',"
		sql_query=sql_query[:-1]
		temp=temp[:-1]
		sql_query=sql_query+temp+");"
		conn.execute(sql_query)
		mydb.commit()
		mydb.close()
		return display(tname)

@app.route("/")
def home():
	tname="AmbulanceServies"
	mydb=connect_db()
	conn =mydb.cursor()
	conn.execute(f"SELECT * FROM {tname}")
	res=conn.fetchall()
	conn.execute(f"Show columns FROM {tname}")
	colname=conn.fetchall()
	mydb.close()
	return render_template("main.html",data=res,colname=colname,Table_Name="All locations that offer Ambulance services")

@app.route("/display/<tname>")
def display(tname):
	mydb=connect_db()
	conn =mydb.cursor()
	conn.execute(f"SELECT * FROM {tname}")
	res=conn.fetchall()
	mydb.close()
	colname=get_columns(tname)
	
	return render_template("main.html",data=res,colname=colname,Table_Name=tname)
if __name__ =="__main__":
	app.run()
