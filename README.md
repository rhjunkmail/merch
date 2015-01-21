# Merch
## A shop that sells products

### To do:

1. defiin emy routes
- In  'config/routes.rb' define restful routes for resources
2. generate controller for primary resource (product)
- define actions for end points
- CRUD products
	- Read - before I can read any data I need a model...
3. generate a model
-product model will have a migration
-list attributes in miograiton file
-run "rake db:migrate"
-seed the db
4. create views for looking at the products
5. Create a form for adding data via the browswer
6. handle create and update actions
7. Provide destroy functionality
---
8. Think about other resources (users)

---
## Notes

### What is REST (and RESTfulness)?

REST stands for REpresentational State Transfer.
Technobabble speak for http conventions expressed through server-side code.

POST requests should CREATE _something in a DB
GET requests should READ _something from a DB
PUT/PATCH request should UPDATE _something in a DB
DELETE request should DESTROY _something in a DB

CRUD out to be RESTful representation of http verbs.