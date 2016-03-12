
i did the assignment on rails 4.0 and i used MySQL 2.7 as my database.

In order to run the app, you need to run from this folder:

rake db:create

and then:

rakd db:migrate

right now in the config/databse.yml file, the db password is mine.
i guess you need to change it for yours mySQL login password.

in windows because of some versions issues with working on 
rails 4.0 and mysql 2.7,
there can be a problem creating the table with 'rake db:migrate',
in that case add the file 'abstract_mysql2_adapter' from the root folder,
to the config/initialzers folder.
after running 'rake db:migrate', need to remove the file.

if somthing might be missing, run 'bundle install'.

start running rails server

the app will then run in the local host on port 3000
http://localhost:3000/ , or: http://localhost:3000/todos

***********************************************************

implementation info:

all the files are located in their rails locations, migrations in the db/migrations,
htmls (reb) in the app/views, and so on.

the app js file is 'todo.js' in app/assets/javascripts folder,
and the css is 'main_style' in app/assets.stylesheets folder.

in order to edit, delete or add new task, i used anh ordinary rails form,
that gets the post data and assign it to the model.

for the 'mark as done' checkbox i used an ajax object so the page will not refresh with each change.
* only if the actiion was succesfull in the server, the row will be marked as done.

i hope its not a problem that i didnt put much effort in the styling,
i assumed the test was more about the learning and implimintaions.

another thing i'd like to say is that mostly i work more organizide,
with code remarks, but sice i worked and learned simultaneously,
it was harder.
