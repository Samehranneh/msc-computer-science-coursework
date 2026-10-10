import Q3 #استدعاء البرنامج Q3 

# تعريف القاموس
d = { "jan" : [ ("Tea", 3000), ("Coffee", 5000), ("Sugar", 2300)],
      "Feb" : [ ("Tea", 2800), ("Coffee", 5500), ("Sugar", 2300)],
      "March" : [ ("Tea", 1900), ("Coffee", 4700), ("Sugar", 4000)]}

# حساب وطباعة متوسط المبيعات لكل شهر
for month in d:
    average_sales = Q3.average_sales  (d, month)
    print(f"Average sales for {month}: {average_sales}")

# حساب وطباعة متوسط المبيعات لكل منتج
for product in ["Tea", "Coffee", "Sugar"]:
    average_sales = Q3.average_sales_product(d, product)
    print(f"Average sales for {product}: {average_sales}")

# طباعة الشهر الذي حقق أعلى مبيعات
max_sales_month = Q3.highest_sales_month(d)
print(f"Highest sales month: {max_sales_month}")

# طباعة اسم المنتج الذي حقق أعلى مبيعات خلال السنة
max_sales_product =Q3.highest_sales_product(d)
print(f"Highest sales product: {max_sales_product}")
