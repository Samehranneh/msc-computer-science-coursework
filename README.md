# M.Sc. Computer Science Coursework

Assignments from the Master's in Computer Science at the Syrian Virtual University (2023–2024). Each folder is one course.

| # | Course | Project | Stack |
|---|---|---|---|
| 01 | Programming Fundamentals | Four console programs: an eligibility checker for civil documents, a number-guessing game, and monthly sales analysis with dictionaries and modules | Python |
| 02 | Database Systems | **Electronic car service card**: relational schema for vehicle owners, cars, service cards, products, carts, bills and orders, with views and sample data (team project) | SQL Server 2019, T-SQL |
| 03 | Cybersecurity | A Tkinter password-strength checker, and a brute-force demo that shows how search time grows with password length and character set | Python, Tkinter |
| 04 | Internet of Things | IoT network simulated and configured in Cisco Packet Tracer (team project) | Packet Tracer 8.2.1 |
| 05 | Introduction to AI | **Family-tree reasoning** with logic programming: facts loaded from CSV, rules for parent, sibling, cousin, grandparent, aunt and uncle | Python, pyDatalog, pandas |
| 06 | Machine Learning | **Movie-rating prediction** on a relational movies dataset (movies, actors, directors, users, ratings): Linear Regression and Decision Tree regressors, then a Perceptron classifier on rating classes, with 5-fold cross-validation | Python, scikit-learn, pandas |
| 07 | Data Mining | **Vehicle classification** on a 1.4 GB vehicles dataset: Logistic Regression, Decision Tree and Naive Bayes. Decision Tree reached 0.64 accuracy. Results site: [vehicle-classification-model-comparison](https://github.com/Samehranneh/vehicle-classification-model-comparison) | Python, scikit-learn |

## Notes

- **06:** cross-validation showed the movie features explain almost none of the rating variance (Linear Regression R² ≈ 0, Decision Tree negative). The Perceptron classifier reached about 18% accuracy across rating classes. Ratings depend mostly on the user, which these item-level features do not capture.
- **06 and 07:** datasets are not included because of their size. The notebooks download or mount them in Google Colab.
- **04:** open `iot_network.pkt` with Cisco Packet Tracer 8.2 or later.

## Run

```bash
pip install pandas scikit-learn pyDatalog
cd 05-ai-logic-programming && python family_tree.py
```
