import re   #imports the regular expression module
import tkinter as tk #for creating graphical user interfaces (GUIs) in Python
from tkinter import messagebox  

def check_password(): #to check password cases with sending messagebox with the needed criteria  
    password = password_entry.get()
    if len(password) < 8:
        messagebox.showerror("Error", "Password must be at least 8 characters long.")
    elif not re.search("[A-Z]", password):
        messagebox.showerror("Error", "Password must contain at least one uppercase letter.")
    elif not re.search("[a-z]", password):
        messagebox.showerror("Error", "Password must contain at least one lowercase letter.")
    elif not re.search("[0-9]", password):
        messagebox.showerror("Error", "Password must contain at least one digit.")
    elif not re.search("[!@#$%^&*]", password):
        messagebox.showerror("Error", "Password must contain at least one special character (!, @, #, $, %, &).")
    else:
        messagebox.showinfo("Success", "Valid Password.")

root = tk.Tk()
root.title(" Password Checker ")
""" creates a new top-level window
    and sets the title of the window to
        "Password Checker" 
"""

password_label = tk.Label(root,font=("Arial",14),padx=60,pady=20,fg="red", text="Enter The Password ")
password_label.pack()

password_entry = tk.Entry(root, show="*")
password_entry.pack()

check_button = tk.Button(root, text="Check Password",overrelief="sunken",activebackground="gray", activeforeground="white", command=check_password)
check_button.pack()

root.mainloop() #continues to run until the window is closed