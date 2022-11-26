import mysql.connector
import docker
from flask import Flask,request,render_template,g
app=Flask(__name__)

def connect_db():
	client=docker.DockerClient()
	container=client.containers.get("db-docker_mysql-development_1")
	ip_ad=container.attrs['NetworkSettings']['IPAddress']
	mydb=mysql.connector.connect(
		host=ip_ad,
		user="guest",
		password="qwerty",
		database="testapp",
		port=3306,
		auth_plugin='mysql_native_password'
	)
	return mydb

@app.route("/display/<tname>")
def display(tname):
	mydb=connect_db()
	conn =mydb.cursor()
	conn.execute(f"SELECT * FROM {tname}")
	res=conn.fetchall()
	conn.execute(f"Show columns FROM {tname}")
	colname=conn.fetchall()
	mydb.close()
	return render_template("main.html",data=res,colname=colname,Table_Name=tname)
if __name__ =="__main__":
	app.run()
