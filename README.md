# FourSquareReplica

order of push/ pull to prevent conflicts
 1. do the normal steps to push your changes to your branch.
 2. git merge qa (from your branch on terminal)
 3. once everything is up to date repeat step 1.
 4. create a pull request on github.
 5. wait for pull request to merge.
 6. git checkout qa
 7. git pull
 8. git checkout **_your branch_**
 9. git merge qa
 10. DONE! so far this pattern has prevented merge conflicts

# Overview
 This app lets the users search for places, activities, and events near them and at a desrired location. The user sees a query list based on their location or a location they put in the search. The user has the ability to toggle from the query list to a map view showing annotations of the queries they have searched for. There is also another tab where the user is able to create folders to save venues in them and give a tip about the place. If the the user is interested in a specific venue they have the ability to save it in a folder they can create and put it in their list of saved venues.  
