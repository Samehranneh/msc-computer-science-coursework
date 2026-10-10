import itertools

def brute_force_password(password_length, characters, user_password):
    for length in range(1, password_length + 1):
        for guess in itertools.product(characters, repeat=length):
            brute_force = ''.join(guess)
            if brute_force == user_password:
                return "correct"
    return "incorrect"

# Define the characters to use in the brute-force attack
characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'!@#$%^&*()*+-.\/[]{}_=`?:;"

# Get user input for the password to test
user_password = input("Enter the password to test: ")

# Call the function with the user password length and characters
result = brute_force_password(len(user_password), characters, user_password)

print(f"The password '{user_password}' is: {result}")