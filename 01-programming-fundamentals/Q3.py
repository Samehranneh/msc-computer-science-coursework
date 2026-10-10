
    # تعريف القاموس
d = { "jan" : [ ("Tea", 3000), ("Coffee", 5000), ("Sugar", 2300)],
      "Feb" : [ ("Tea", 2800), ("Coffee", 5500), ("Sugar", 2300)],
      "March" : [ ("Tea", 1900), ("Coffee", 4700), ("Sugar", 4000)]}

# حساب وطباعة متوسط المبيعات لكل شهر
for month, products in d.items():
    total_sales = sum([sales for product, sales in products])
    average_sales = total_sales / len(products)
    print(f"Average sales for {month}: {average_sales}")

# حساب وطباعة متوسط المبيعات لكل منتج
products_sales = {}
for month, products in d.items():
    for product, sales in products:
        if product not in products_sales:
            products_sales[product] = [sales]
        else:
            products_sales[product].append(sales)

for product, sales in products_sales.items():
    average_sales = sum(sales) / len(sales)
    print(f"Average sales for {product}: {average_sales}")

# طباعة الشهر الذي حقق أعلى مبيعات
max_sales_month = max(d, key=lambda x: sum([sales for product, sales in d[x]]))
print(f"The month with the highest sales is {max_sales_month}")

# طباعة اسم المنتج الذي حقق أعلى مبيعات خلال السنة
all_sales = []
for month, products in d.items():
    for product, sales in products:
        all_sales.append((product, sales))

max_sales_product = max(all_sales, key=lambda x: x[1])[0]
print(f"The product with the highest sales is {max_sales_product}")
