import tkinter as tk
from tkinter import messagebox

root = tk.Tk()
root.withdraw()  # Скрываем основное окно
messagebox.showinfo("Message", "hi")
root.destroy()