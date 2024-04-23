# For installs:
# pip install pandas
# pip install pandastable
# pip install pandasgui

import os
import pandas as pd
import tkinter as tk
from tkinter import ttk
from pandastable import Table, TableModel
from pandasgui import show

# # Function to load data from a selected file
# def load_data(file_path):
#     # Check file extension to determine the type of file
#     if file_path.endswith('.csv'):
#         data = pd.read_csv(file_path)
#     elif file_path.endswith('.xlsx'):
#         data = pd.read_excel(file_path)
#     else:
#         raise ValueError("Unsupported file format. Only CSV and Excel files are supported.")
#     return data

# # Function to create the GUI
# def create_gui():
#     def load_selected_file():
#         selected_file = file_var.get()
#         file_path = os.path.join("Data", selected_file)
#         data = load_data(file_path)
#         table = Table(root, dataframe=data)
#         table.show()

#         # Add a button to show PandasGUI filters
#         show_button = tk.Button(root, text="Show Filters", command=lambda: show(data))
#         show_button.pack()

#     root = tk.Tk()
#     root.title("Interactive Data Viewer")

#     # Create a drop-down menu to select files
#     files = os.listdir("Data")
#     file_var = tk.StringVar(root)
#     file_var.set(files[0])  # Default selection
#     file_dropdown = ttk.Combobox(root, textvariable=file_var, values=files, state="readonly")
#     file_dropdown.pack()

#     # Button to load selected file
#     load_button = tk.Button(root, text="Load File", command=load_selected_file)
#     load_button.pack()

#     root.mainloop()

# # Main function
# def main():
#     create_gui()

# if __name__ == "__main__":
#     main()
