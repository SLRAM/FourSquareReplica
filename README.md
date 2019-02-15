# FourSquareReplica

order of push/ pull to prevent conflicts
 1. do the normal steps to push your changes to your branch.
 2. git merge qa (from your branch on terminal)
 3. once everything is up to date repeat step 1.
 4. create a pull request on github.
 5. wait for pull request to merge.
 6. git checkout qa
 7. git pull
 8. git checkout <your branch>
 9. git merge qa
 10. DONE! so far this pattern has prevented merge conflicts
