
import mysql.connector

class Main:
    def __init__(self):
        self.mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            passwd="root",
            port="8889",
            database="pharmadb"
        )
        self.choice = self.Menu()
        if self.choice == 1:
            self.Search()
        elif self.choice == 2:
            self.Delete()
        elif self.choice == 3:
            self.Insert()
        elif self.choice == 4:
            print("Goodbye!")
            exit()
        else:
            print("Invalid choice")
            exit()

    def Menu(self):
        print("Welcome to the PharmaDB database, press the numbers for each:\n1. Search\n2. Delete\n3. Insert\n4. Exit")
        choice = int(input("Enter your choice: "))
        return choice

    def Search(self):
        search_table = input("Enter the table you want to search: ")
        search_column = input("Enter the column you want to search: ")
        search_value = input("Enter the value you want to search: ")
        # search the database
        try:
            mycursor = self.mydb.cursor()
            mycursor.execute("SELECT * FROM " + search_table +
                             " WHERE " + search_column + " = '" + search_value + "'")
            myresult = mycursor.fetchall()

            # print the results
            for x in myresult:
                print(x)

            input_search = input("Do you want to search again? (y/n): ")
            if input_search == "y":
                self.Search()
        except:
            print("Error: unable to fetch data")

    def Delete(self):
        delete_table = input("Enter the table you want to delete from: ")
        delete_column = input("Enter the column you want to delete: ")
        delete_value = input("Enter the value you want to delete: ")
        # delete the database
        try:
            mycursor = self.mydb.cursor()
            mycursor.execute("DELETE FROM " + delete_table +
                             " WHERE " + delete_column + " = '" + delete_value + "'")
            self.mydb.commit()
            print("Deleted successfully")
            input_delete = input("Do you want to delete again? (y/n): ")
            if input_delete == "y":
                self.Delete()
        except:
            print("Error: unable to delete data")

    def Insert(self):
        insert_table = input("Enter the table you want to insert into: ")
        insert_column = input(
            "Enter the column/columns you want to insert.\nEnter with comma (,) separated: ")
        insert_value = input(
            "Enter the value/values you want to insert.\nEnter with comma (,) separated: ")

        mycursor = self.mydb.cursor()
        mycursor.execute("INSERT INTO " + insert_table +
                         " (" + insert_column + ") VALUES (" + insert_value + ")")
        self.mydb.commit()
        print("Inserted successfully")
        input_insert = input("Do you want to insert again? (y/n): ")
        if input_insert == "y":
            self.Insert()


while(True):
    Main()
