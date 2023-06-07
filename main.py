import subprocess as sp
import pymysql
import pymysql.cursors
from tabulate import tabulate


#INSERTIONS
def Insert_animal():
    try:
        r1={}
        print("Enter the details of the animal")
        r1["AnimalID"] = input("Animal ID: ")
        r1["Zooname"] = input("Zoo name:")
        r1["Speciesname"] = input("Species name: ")
        r1["Height"] = int(input("Height: "))
        r1["Weight"] = int(input("Weight: "))
        r1["Age"] = int(input("Age: "))

        q1 = "SELECT Speciesname from SPECIES where zooname='%s' and speciesname='%s'" % (
            r1["Zooname"],
            r1["Speciesname"],
       )
        
        rows = cur.execute(q1)

        
        if(rows==0):
            r2={}
            r2["Speciesname"] = r1["Speciesname"]
            r2["Zooname"] = r1["Zooname"]
            r2["Eid"] = input("Enter EID of employee who takes care: ")
            q2 = "INSERT INTO SPECIES VALUES('%s', '%s', '%s')" % (
                r2["Speciesname"],
                r2["Zooname"],
                r2["Eid"],
            )
            cur.execute(q2)
            food = input("Enter food of the species separated by commas: ")
            items = food.split(",")
            for item in items:
                q3 = "INSERT INTO SPECIES_FOOD VALUES('%s','%s')" % (
                    r2["Speciesname"],
                    item,
                )
                cur.execute(q3)
            
            
        q4 = "INSERT INTO ANIMAL VALUES('%s', '%s', '%s', '%d', '%d', '%d')" % (
                r1["AnimalID"],
                r1["Zooname"],
                r1["Speciesname"],
                r1["Height"],
                r1["Weight"],
                r1["Age"],
        )
        cur.execute(q4)

        colors = input("enter the colours of the animal separated by commas: ")
        c = colors.split(",")
        for color in c:
            q = "INSERT INTO ANIMAL_COLOUR VALUES('%s','%s','%s')" % (
                r1["AnimalID"],
                r1["Zooname"],
                color,
            )
            cur.execute(q)
        

        con.commit()
        print("Inserted Into Database")
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print("ERROR: ", e)

    return

def BEST_ZOO():
    try:
        q = "select P.ZooName AS 'BEST ZOO' FROM (SELECT COUNT(*) AS C, ZooName FROM SPECIES GROUP BY ZooName) AS P WHERE P.C IN (SELECT MAX(T.C) FROM (SELECT COUNT(*) AS C FROM SPECIES GROUP BY ZooName) AS T)"
        rows = cur.execute(q)
        res = cur.fetchall()
        t = [i[0] for i in cur.description]
        entry = []
        for j in range(rows):
            entry.append([res[j-1][k] for k in t])
        print(tabulate(entry, headers=t, tablefmt='psql'))
    except Exception as e:
        con.rollback()
        print("Failed to execute")
        print("ERROR: ", e)
    return


def Insert_employee():
    try:
        r1={}
        print("Enter the details of the employee")
        r1["EID"] = input("Employee ID: ")
        r1["ZooName"] = input("Zoo Name: ")
        r1["Fname"] = input("First name:")
        r1["Lname"] = input("Last name: ")
        r1["Age"] = int(input("Age: "))
        r1["Gender"] = input("Gender: ")
        r1["Salary"] = int(input("Salary: "))

        q1 = "INSERT INTO EMPLOYEE VALUES('%s', '%s', '%s', '%s', '%d', '%c', '%d')" % (
                r1["EID"],
                r1["ZooName"],
                r1["Fname"],
                r1["Lname"],
                r1["Age"],
                r1["Gender"],
                r1["Salary"],
        )
        cur.execute(q1)
        con.commit()
        print("Inserted Into Database")
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print("ERROR: ", e)

    return

def Insert_Customer():
    try:
        r1={}
        print("Enter the details of the Customer")
        r1["CustomerID"] = input("CustomerID: ")
        r1["Fname"] = input("Fname:")
        r1["Lname"] = input("Lname: ")
        r1["Age"] = int(input("Age: "))
        r1["Gender"] = input("Gender: ")
        r1["PhoneNum"] = int(input("PhoneNum: "))
        Zooname = input("Enter Zoo Visited")
        Ticketnum = input("Enter TicketNum: ")
        q1 = "INSERT INTO CUSTOMER VALUES('%s', '%s', '%s', '%d', '%c', '%d')" % (
                r1["CustomerID"],
                r1["Fname"],
                r1["Lname"],
                r1["Age"],
                r1["Gender"],
                r1["PhoneNum"],
        )
        cur.execute(q1)
        q2 = "INSERT INTO TICKET VALUES('%s', '%s', '%s')" % (
                Zooname,
                Ticketnum,
                r1["CustomerID"],
        )
        cur.execute(q2)

        q3 = "INSERT INTO CUSTOMER_ZOO VALUES('%s', '%s')" % (
                r1["CustomerID"],
                Zooname,
        )
        cur.execute(q3)

        con.commit()
        print("Inserted Into Database")
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print("ERROR: ", e)

    return
def List_animal():
    try:
        r1={}
        print("Enter the details of the animal")
        r1["AnimalID"] = input("Animal ID: ")
        r1["Zooname"] = input("Zoo name:")
        q1 = "SELECT * from ANIMAL where AnimalID='%s' and  Zooname='%s'" % (
            r1["AnimalID"],
            r1["Zooname"],
       )
        rows = cur.execute(q1)
        res = cur.fetchall()
        t = [i[0] for i in cur.description]
        entry = []
        for j in range(rows):
            entry.append([res[j-1][k] for k in t])
        print(tabulate(entry, headers=t, tablefmt='psql'))
        cur.execute(q1)
        con.commit()
        print("Inserted Into Database")
    except Exception as e:
        con.rollback()
        print("Failed to check into database")
        print("ERROR: ", e)
    return

def List_noofvisitors():
    try:
        print("Enter the Name of the Zoo : ")
        Zooname = input()
        q1 = "SELECT COUNT(*) from CUSTOMER_ZOO GROUP BY Zoovisited HAVING Zoovisited = '%s'" % (
            Zooname,
       )
        rows = cur.execute(q1)
        res = cur.fetchall()
        t = [i[0] for i in cur.description]
        entry = []
        for j in range(rows):
            entry.append([res[j-1][k] for k in t])
        print(tabulate(entry, headers=t, tablefmt='psql'))
        cur.execute(q1)
        con.commit()
        print("Inserted Into Database")
    except Exception as e:
        con.rollback()
        print("Failed to check into database")
        print("ERROR: ", e)

    return

def Update_Salary():
    try:
        r1={}
        print("Enter the details of Employee: ")
        r1["EID"] = input("Employee ID: ")
        r1["ZooName"] = input("Name of the Zoo:")
        r1["Salary"] = int(input("Enter the Salary to which we should update:"))
        q1 = "UPDATE EMPLOYEE SET SALARY = '%d' WHERE EID='%s' AND ZooName = '%s' " % (
            r1["Salary"],
            r1["EID"],
            r1["ZooName"],
       )
        cur.execute(q1)   
        con.commit()
        print("Updated Database")
    except Exception as e:
        con.rollback()
        print("Failed to check into database")
        print("ERROR: ", e)
    return

def Update_Age():
    try:
        r1={}
        print("Enter the details of Employee: ")
        r1["EID"] = input("Employee ID: ")
        r1["ZooName"] = input("Name of the Zoo:")
        r1["Age"] = int(input("Enter the Age to which we should update:"))
        q1 = "UPDATE EMPLOYEE SET Age = '%d' WHERE EID='%s' AND ZooName = '%s' " % (
            r1["Age"],
            r1["EID"],
            r1["ZooName"],
       )
        cur.execute(q1)
        con.commit()
        print("Updated Database")
    except Exception as e:
        con.rollback()
        print("Failed to check into database")
        print("ERROR: ", e)
    return

def Total_income():
    try:
        ZooName = input("Enter ZooName: ")
        q = "SELECT (n*T.Price_for_adults) AS TOTALINCOME FROM TICKET_COUNTER AS T, (select COUNT(*) AS n,ZooName FROM TICKET GROUP BY ZooName) AS P WHERE P.ZooName='%s' AND T.Zooname ='%s'"%(
            ZooName,
            ZooName,
        )
        rows = cur.execute(q)
        res = cur.fetchall()
        t = [i[0] for i in cur.description]
        entry = []
        for j in range(rows):
            entry.append([res[j-1][k] for k in t])
        print(tabulate(entry, headers=t, tablefmt='psql'))
    except Exception as e:
        con.rollback()
        print("Failed to execute")
        print("ERROR: ", e)
    return

def q12():
    try:
        s= int(input("Enter the salary: "))
        q = "SELECT EID,Fname,Lname,ZooName,Salary From EMPLOYEE where salary>'%s'" % (
            s,
        )
        rows = cur.execute(q)
        res = cur.fetchall()
        title = [i[0] for i in cur.description]
        entry = []
        for j in range(rows):
            entry.append([res[j-1][k] for k in title])
        print(tabulate(entry, headers=title, tablefmt='psql'))
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print("ERROR: ", e)
    return

def UPDATE_ZOOVISITED():
    try:
        CUSTid = input("Enter CUSTOMERID: ")
        Zooname = input("Enter Zoo Name: ")
        q = "INSERT INTO CUSTOMER_ZOO VALUES ('%s','%s')"%(
            CUSTid,
            Zooname,
        )
        cur.execute(q)
        con.commit()
        print("Inserted into database")
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print("ERROR: ", e)

    return

def Update_Manager():
    try:
        zooname = input("Enter ZooName: ")
        mgrid = input("Enter new Manager ID: ")
        q1 = "UPDATE ZOO SET mgrid='%s' WHERE zooname='%s' " %(
            mgrid,
            zooname,
        )
        cur.execute(q1)
        con.commit()
        print("updated Database")
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print("ERROR: ", e)
    return

def Delete_Animal():
    try:
        animalID = input("Enter AnimalID: ")
        zooname = input("Enter Zooname: ")
        q1 = "DELETE FROM ANIMAL WHERE animalid='%s' AND zooname='%s'" % (
            animalID,
            zooname,
        )
        cur.execute(q1)
        con.commit()
        print("Deleted from Database")
    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print("ERROR: ", e)
    return

def Update_ticketprice():
    try:
        a=input("Enter Y if you want to update price of adult else enter N: ")
        if(a=="Y"):
            print("Enter the details of Zoo")
            r1={}
            r1["Zooname"] = input("Enter Zoo Name: ")
            r1["Price"] = int(input("Enter the Price to which we should update:"))
            q1 = "UPDATE TICKET_COUNTER SET Price_for_adults = '%d' WHERE ZooName = '%s' " % (
                 r1["Price"],
                 r1["Zooname"],
            )     
            cur.execute(q1)
            cur.execute(q1)
            con.commit()
            print("Updated Database")
        b=input("Enter Y if you want to update price of childen else enter N: ")
        if(b=="Y"):
            print("Enter the details of Zoo")
            r1={}
            r1["Zooname"] = input("Enter Zoo Name: ")
            r1["Price"] = int(input("Enter the Price to which we should update:"))
            q2 = "UPDATE TICKET_COUNTER SET Price_for_children = '%d' WHERE ZooName = '%s' " % (
                 r1["Price"],
                 r1["Zooname"],
            )     
            cur.execute(q2)
            cur.execute(q2)
            con.commit()
            print("Updated Database")     
    except Exception as e:
            con.rollback()
            print("Failed to check into database")
            print("ERROR: ", e)
    return

def Delete_Employee():
    try:
        Eid = input("Enter EmployeeID: ")
        Zooname = input("Enter Zoo Name: ")
        q = "DELETE FROM EMPLOYEE WHERE EID = '%s' AND ZooName = '%s'"%(
            Eid,
            Zooname,
        )
        cur.execute(q)
        con.commit()
        print("Deleted from Database")
    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print("ERROR: ", e)

    return


def dispatch(ch):
    if (ch==1):
        Insert_animal()
    elif (ch==2):
        Insert_employee()
    elif (ch==3):
        Insert_Customer()
    elif (ch==4):
        Delete_Employee()
    elif (ch==5):
        Delete_Animal()
    elif (ch==6):
        Update_Salary()
    elif (ch==7):
        UPDATE_ZOOVISITED()
    elif (ch==8):
        Update_Manager()
    elif (ch==9):
        Update_ticketprice()
    elif (ch==10):
        Update_Age()
    elif (ch==11):
        List_animal()
    elif (ch==12):
        List_noofvisitors()
    elif (ch==13):
        Total_income()
    elif (ch==14):
        q12()
    elif (ch==15):
        BEST_ZOO()

while(1):
    tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hardcode username and password
    username = input("Username: ")
    password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user=username,
                              password=password,
                              db='DNA',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                print("1. Insert details of a new animal into a zoo")   
                print("2. Insert details of an employee")  
                print("3. Insert customer details")  
                print("4. Delete details of employee who leaves")  
                print("5. Delete details of animal")  
                print("6. Update the salary of an employee")
                print("7. Update the zoo visited by a customer")
                print("8. Update manager of a zoo")
                print("9. Update the ticket price in a zoo")
                print("10. Update the age of an employee")
                print("11. List the details of an animal")
                print("12. Get the Number of visitors visiting a zoo")
                print("13. Get the Total income of a zoo")
                print("14. Get the list of employees with salaries above some value")
                print("15. Best zoo to visit")
                print("16. logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 16:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")