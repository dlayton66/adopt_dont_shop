[ ] done

18. Pets can only have one approved application on them at any time

As a visitor
When a pet has an "Approved" application on them
And when the pet has a "Pending" application on them
And I visit the admin application show page for the pending application
Then next to the pet I do not see a button to approve them
And instead I see a message that this pet has been approved for adoption
And I do see a button to reject them

Database Logic Part 2

These stories emphasize SQL and ActiveRecord concepts.

[ ] done

SQL Only Story

For this story, you should write your queries in raw sql. You can use the ActiveRecord find_by_sql method to execute raw sql queries: https://guides.rubyonrails.org/active_record_querying.html#finding-by-sql

19. Admin Shelters Show Page

As a visitor
When I visit an admin shelter show page
Then I see that shelter's name and full address

NOTE: Your query should only return the necessary data to complete the story

ActiveRecord

For the following stories, you should fully leverage ActiveRecord methods in your queries.

[ ] done

20. Shelters with Pending Applications Listed Alphabetically

As a visitor
When I visit the admin shelter index ('/admin/shelters')
And I look in the section for shelters with pending applications
Then I see all those shelters are listed alphabetically

[ ] done

21. Admin Shelters Show Page Links

As a visitor
When I visit the admin shelter index ('/admin/shelters')
Then I see that every shelter name is a link
When I click one of these links
Then I am taken to that shelter's admin show page

[ ] done

22. Average Pet Age

As a visitor
When I visit an admin shelter show page
Then I see a section for statistics
And in that section I see the average age of all adoptable pets for that shelter

[ ] done

23. Count of Adoptable Pets

As a visitor
When I visit an admin shelter show page
Then I see a section for statistics
And in that section I see the number of pets at that shelter that are adoptable

[ ] done

24. Count of Pets that have been Adopted

As a visitor
When I visit an admin shelter show page
Then I see a section for statistics
And in that section I see the number of pets that have been adopted from that shelter

Note: A Pet has been adopted from a shelter if they are part of an approved application

[ ] done

25. Action Required

As a visitor
When I visit an admin shelter show page
Then I see a section titled "Action Required"
In that section, I see a list of all pets for this shelter that have a pending application and have not yet been marked "approved" or "rejected"

[ ] done

26. Action Required Links to Application Show Page

As a visitor
When I visit an admin shelter show page
And I look in the "Action Required" section
Then next to each pet's name I see a link to the admin application show page where I can accept or reject the pet.
