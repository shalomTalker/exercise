# Exercise

The goal of this exercise is to implement a simple http server with several API calls, create one missing table and write some SQL queries 
to perform the desired actions.
The API serves data and performs actions for a small television series service called WebFlix. 
There are TV series that have several seasons that in turn have several episodes. There are also users who watch these episodes and submit ratings.

## General guidelines

You are provided with a minimal amount of skeleton structure needed for this task. These stuctures should NOT be changed in any way, only extended further.
Code architecture and file structure are important! Consider that when adding new variables, functions and files.
All the needed dependencies to solve this exercise are already specified in the `package.json` file, but feel free to add others and add 
them to the `package.json` file.

You should create your own branch when working on this repo! Once done, merge your changes to the master branch

## Database

You will be using a MySQL database to solve this exercise.
You can use a MySQL server on your local machine, a VM or any machine on any cloud services provider. If none of these are possbile, we can allocate
you a database for your needs.
You will be using the [standard MySQL library](https://github.com/mysqljs/mysql) for Node.JS since it can provide everything you need for this exercise.
Most of the basic operations that you need are present in the skeleton files, feel free to add more if you think they're needed and 
don't hesitate to consult the documentation of this library.
All the code related to db operations should be in the `db.js` file. 

### Tables

Your have been provided with a script file `database.sql` to create all tables (except one...) that you need. 
Run this script on the database you're using.

One critical table is missing from the provided file!
You task here is to add its definition to the file and execute the script to create it.
After creating the table, use the corresponding API call to add some data into it. This will provide you with information to perform another API call.

### Queries

You are provided with two methods for executing queries in the `db.js` file called `executeQueryWithCallback` and `executeQueryWithPromise`. 
These are simple wrappers of the generic `query` method - one intended for callbacks and the other for promises.
You should use them to execute your queries, without limitation or restrictions.
These methods are sufficient to solve this exercise. If you really believe you need to change or extend them, create a new wrapper function.

## Server

### General

No server related code is provided for you in advance, it's completely up to you to write the API server, router or any other components you think are needed.
The specification of the API is also up to you. HTTP request methods, endpoints and query parameters are yours to define according to your understanding.
Data validation is not mandatory but will be acceptable.

### API calls

#### fetchSeriesWithJoins

This API call should retrieve the entire collection of series with the collection of seasons containing all episodes with no restrictions on join operations.
The returned information should contain a list of all series plus its seasons plus their episodes in the db, organized in an hierarchical manner with series being 
the top level, seasons as the second level and episodes the bottom level.
Example: 
```
[
  {
    //Series properties go here
    "seasons": [
      {
        //Season properties go here
        "episodes": [
          {
            //Episode properties go here
          }
        ]
      }
    ]
  }
]
```

#### fetchSeriesNoJoins

This API call should retrieve the entire collection of series with the collection of seasons containing all episodes WITHOUT using any join operations in db queries.
Return information should be similar to the structure and logic specified for `fetchSeriesWithJoins`.

NOTE

For the sake of this API call ONLY assume the following:
The server runs in a cloud environment on a very small machine with minimal resources. 
On the other hand - the database is deployed on the same cloud environment on a much more powerful machine and the latency between both machines is minimal.
Keep this in mind when implementing this API call.

#### addUserWatchData

This API call should add viewing information of a certain episode by a certain user. 
The provided information should contain the id of the user watching, the episode id he watched and his rating for the episode (1-5 stars).
The returned information should contain an indication about the success or failure of the action.

#### fetchUserWatchHistory

This API call should retrieve the watch history for a specific user.
The provided information should contain the id of the user.
The returned information should contain a list of all episodes watched by the user, organized in an hierarchical manner with series being 
the top level, seasons as the second level and episodes the bottom level.
The structure of the returned information should be similar to the one specified for `fetchSeriesWithJoins`