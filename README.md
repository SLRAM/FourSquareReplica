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

     
    * ImageView of custom logo
    * Buttons to search with preselected query terms
    * Button to search with user location. If user location is disabled then searches with location term
    
    
Buttons should list suggested searches.  Pressing the button will segue to new view with list of venues for that suggestion.

### Home Detail

This view has:

     
    * Location image
    * Location information labels
    * Button that presents an action sheet



The view will also have (2) search bars, one for entering a different desired place, the other for manual location change.  You also have the option to sort the locations by distance to you.  There is also a map in the navigation bar to help in navigating to location.  Selecting the location cell will open up a view with that venue's information as well as option to "add to list" or "add a tip" or "get directions"

#### Action Sheet

This view has:

     
    * add tips button that presents the user with a text field to save their tip
    * add to list button that presents the user with a collection view of their saved lists
    * get directions button that leaves the app and opens apple Maps

## Lists

This view should have: 

    * Collection View
    * Button

Collection View will list folder names created by user.  Selecting the folder cell will segue to a view with a list of venues favorited by User.
    

# Endpoints 

https://api.foursquare.com/v2/venues/search

https://api.foursquare.com/v2/venues/\(venueID)/photos

    
# Authors and Acknowledgments

Stephanie Ramirez - Team Lead
Ibraheem Rawlinson - Project Lead
Antonio Flores - Tech Lead
Alyson Abril - Design Lead


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


