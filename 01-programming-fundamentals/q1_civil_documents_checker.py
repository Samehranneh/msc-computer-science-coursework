print("PLEASE ENTER THE WORDS THE SAME LETTERS CASE IN THE PROGRAM")    #للادخال مثلما مكتوب من اجل المقارنة
age = int(input("Enter your age please : "))        #المستدم يدخل العمر
gender = input("Enter your gender (male/female): ")     #المستخدم يدخل ذكر ام انثى
employed = input("Are you employed ? (yes/no): ")       #هل هو موظف ام لا
id = input("Do you have an ID ? (yes/no): ")    #هل لديه هوية شخصية نعم ام لا

if age < 18:        #لمقارنة اذا كان اقل من 18 ليحضر اخراج قيد 
    print("You only need your civil record.")
elif age >= 18 and age <= 42 and gender == "male":  #اذا اكبر من 18 وهو ذكر يطبع انه بحاجة لموافقة 
    print("You need recruitment approval.")
elif employed == "yes":     #في حال اذا كان موظف فهو بحاجة موافقة الادارة 
    print("You need your boss's approval.")
elif id == "no":  #اذا كان فقاد الهوية الشخصية فبحاجة ضبط شرطة + اخراج قيد
    print("You need civil record with police report.")
else:
    print("Your ID is enough.")
