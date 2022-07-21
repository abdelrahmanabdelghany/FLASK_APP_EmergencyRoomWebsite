from flask import Flask, redirect, url_for, request,render_template
import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="mysql",
  database="hospitaleu"
)
mycursor = mydb.cursor()

app = Flask(__name__)

@app.route('/')
def index():
  return render_template('index.html')
@app.route('/viewdoc', methods=['POST', 'GET'])
def viewdoctor():
  if request.method == 'POST':
    return render_template('index.html')
  else:
    mycursor.execute("SELECT * FROM doctor")
    row_headers = [x[0] for x in mycursor.description]
    myresult = mycursor.fetchall()
    data = {
      'message': "data retrieved",
      'rec': myresult,
      'header': row_headers
    }
    return render_template('viewdoc.html', data=data)

@app.route('/viewpt', methods=['POST', 'GET'])

def viewpatients():
  if request.method == 'POST':
    return render_template('index.html')
  else:
    mycursor.execute("SELECT * FROM patient")
    row_headers = [x[0] for x in mycursor.description]
    myresult = mycursor.fetchall()
    data = {
      'message': "data retrieved",
      'rec': myresult,
      'header': row_headers
    }
    print(data)
    return render_template('viewpt.html', data=data)
@app.route('/entrydoc', methods=['POST', 'GET'])
def entrydoc():
    if request.method == 'POST':
      ssn =request.form['ssn']
      fname = request.form['fname']
      age = request.form['age']
      gender= request.form['gender']
      address=request.form['address']
      occupation=request.form['occupation']
      salary=request.form['salary']
      shift=request.form['shift']
      print(ssn,fname, age,gender,address,occupation,salary,shift)
      sql = "INSERT INTO doctor (doctor_SSN,name, age,gender,address,occupation_in_hospital,salary,shift) VALUES (%s, %s, %s,%s, %s, %s,%s,%s)"
      val = (ssn,fname, age,gender,address,occupation,salary,shift)
      mycursor.execute(sql, val)
      mydb.commit()
      return render_template('index.html')
    else:
      return render_template('entrydoc.html')
@app.route('/entrypt', methods=['POST', 'GET'])
def entrypt():
    if request.method == 'POST':
      fname = request.form['fname']
      gender= request.form['gender']
      age = request.form['age']
      city=request.form['city']
      street=request.form['street']
      emergency=request.form['emergency']
      number=request.form['number']
      ssn = request.form['ssn']
      print(ssn,fname,age,gender,city,street,emergency,number)
      sql = "INSERT INTO patient (SSN,name, age,gender,city,street,emergency_name,phone_number) VALUES (%s, %s, %s,%s, %s, %s,%s, %s)"
      val = (ssn,fname, age,gender,city,street,emergency,number)
      mycursor.execute(sql, val)
      mydb.commit()
      return render_template('index.html')
    else:
      return render_template('entrypt.html')



if __name__ == '__main__':
  app.run()