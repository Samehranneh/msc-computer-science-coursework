import random


number = random.randint(1,20)   # توليد رقم عشوائي بين 1 و 20   

guess_count = 0         # تهيئة عداد التخمين بالقيمة 0

# حلقة حتى المستخدم يقوم بتخمين الرقم الصحيح
while guess_count < 5:
    guess = int(input("Guess the number between 1 and 20 : "))  # اسئل المستخدم ان يخمن الرقم


    guess_count = guess_count + 1       # زيادة عداد التخمينات 

   
    if guess == number:      # افحص فيما اذا كان التخمين صحيح
        print("Congratulations! You guessed the number in", guess_count, "guesses.")
        break
    elif guess < number:    # مساعدة المستخدم في حال كان التخمين اقل من الرقم
        print("The number is higher. Try again.")
    else:                    # مساعدة المستخدم في حال كان التخمين اعلى من الرقم 
        print("The number is lower. Try again.")
        
if guess_count == 5 and guess != number : # في حال انتهاء المحاولات طباعة الرقم مع رسالة 
     print("BETTER LUCK NEXT TIME THE RIGHT ANSWER IS : ", number)
     raise SystemExit     # لانهاء البرنامج (اللعبة)

