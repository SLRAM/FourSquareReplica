# FourSquares

Use FourSquares to search for places, activities, and events near you or desired location. 

    * The user sees a query list based on their location or a location manually entered in the search. 
    * The user has the ability to toggle from the query list to a map view showing annotations of the queries they have searched for. 
    * The user has option to switch tabs to where the user is able to create folders to save venues and/or give a tip about location. 
    * The user also has ability to add/delete from their list of saved venues.
    * The added venues are sorted in the folders by most recent date added.

# Detailed Outline

App has (2) tabs:
   * Home
   * Lists

## Home

This view has:

   * Image view of custom logo
   * Buttons to search with preselected query terms
   * Button to search with user location. If user location is disabled then searches with location term
   
   ![deny location gif](https://github.com/SLRAM/FourSquareReplica/blob/dev-steph/Images/denyLocations.gif)


### Home Search View
This view has:

   * (2) search bars
      * query/term to search
      * near/location to search

### Home List View

This view has:

   * Table view populated with searched venue information
   * When cell is clicked it segues to home detail

### Home Map View

This view has:

   * Map view
   * Location annotations of searched venues
   * when annotation is clicked it segues to home detail
   
   ![home views gif](https://github.com/SLRAM/FourSquareReplica/blob/dev-steph/Images/locationSearch.gif)

### Home Detail

This view has:

   * Location image
   * Location information labels
   * Button that presents an action sheet
   
   ![home detail gif](https://github.com/SLRAM/FourSquareReplica/blob/dev-steph/Images/actionSheet.gif)

The view will also have (2) search bars, one for entering a different desired place, the other for manual location change.  You also have the option to sort the locations by distance to you.  There is also a map in the navigation bar to help in navigating to location.  Selecting the location cell will open up a view with that venue's information as well as option to "add to list" or "add a tip" or "get directions"

#### Action Sheet

This section has:

   * add tips button that presents the user with a text field that saves with data persistence manager
   * add to list button that presents the user with a collection view of their saved lists
   * get directions button that leaves the app and opens apple Maps
   
   ![action sheet directions gif](https://github.com/SLRAM/FourSquareReplica/blob/dev-steph/Images/actionSheetDirections.gif)

## Lists

This view has: 

   * Button that allows the user to create a new collection
   * Collection view of created favorites lists
   * Lists are saved with data persistence manager
   
### Lists Detail

This view has:
   
   * Table view of saved locations
   

Collection View will list folder names created by user.  Selecting the folder cell will segue to a view with a list of venues favorited by User.
    

# Endpoints 

https://api.foursquare.com/v2/venues/search

https://api.foursquare.com/v2/venues/\(venueID)/photos

    
# Authors and Acknowledgments

[Stephanie Ramirez](https://github.com/SLRAM) - Team Lead

[Ibraheem Rawlinson](https://github.com/Ibraheemraw) - Project Lead

[Antonio Flores](https://github.com/AntonioFlores1) - Tech Lead

[Alyson Abril](https://github.com/alysonabril) - Design Lead


# License 
MIT License


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
