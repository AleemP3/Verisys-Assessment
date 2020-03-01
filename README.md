# Source code

Source Code can be found in file verisys-assessment.rb 

# JSON Output from the 3 samples that you ingest

The 3 JSON outputs of the 3 CSV files can be found as sample10.json, sample50.json, and sample100k.json. I also included another json file that stores all the removed records from all 3 files under removed_records_sample.json.

# Instructions 

To build/run the current app, download the project as a zip file or copy the repository from my GitHub at (https://github.com/AleemP3/Verisys-Assessment). Once you have the project, in your terminal directory make sure you are in the project folder. Run the command "ruby verisys-assessment.rb" and that will start the application up in your terminal. From there you will be prompted a Menu to follow as a Vandelay Industries employee. I hard coded the files name into my code since I was not able to get to the UI portion of the assessment. Following the menu you can choose which file of the 3 you would like to upload. Each time you select a CSV file, it will automatically clean up the phone numbers as well as validate the license numbers. If the license number do not validate or is null it will remove the record from the JSON file. Those files are then stored in a separate array in which you can create a json file as well as view which records have been removed by selecting option 2 from the opening menu 

# Overview of the process you used and the technologies you used

In this assessment, I used Ruby to build the application. Since Ruby/Rails and ReactJS are the languages I am most comfortable with and verisys uses Ruby as your backend language I wanted to showcase my knowledge using Ruby. After reading the challenge steps, this definitely was going to be one of the most difficult tasks I have been given however that did not shy me away from doing my best. I read over each challenge thoroughly to make sure my code was tested and completed before moving onto the next challenge. I kept an open mind and used online resources to my advantage whenever I became stuck with an obstacle. 

# Any challenges you faced

Some challenges I faced while working on this assessment were figuring out how to convert the CSV file to a JSON object, writing test code and figuring out my approach on how to do the assessment. I first attempted to format the CSV data/JSON file after uploading to Ruby by manual code however I could not figure it out so I had to resort to using the JSON gem to format the JSON file to look more clean. I have very little knowledge on writing test code, but this is something I am willing to learn as an engineer. This is my first take home assessment so I was not sure what to expect. Overall I had a mindset/goal to give Verisys what they were looking for from each challenge step and wanted to ensure what I gave works. this was a fun, exciting, and very challenging but nonetheless a great experience. 

# Questions or assumptions you made

Questions:
  - How to clean up my code more
  - Areas of opportunity to improve 
  - For the 100k sample CSV it took a while to process and create the JSON file due to how large the file was. Is there a way to speed this up? Maybe a better process on uploading the file and converting it to an object?

Assumptions:

  For the first challenge step I wasn't quite sure what Verisys may have wanted in the command line interface so made up a menu of what Vandelay Industries employees maybe be looking for when using the application while keeping the objectives from the challenges in mind. I was going to create a bigger menu where you are able to view all records on one JSON file. That file would also be sure to merge duplicates that are found within each JSON file. Though I was not able to get that far into the challenges.

# Next steps to finish the challenge

Steps I did not complete: 

1. Create a simple UI for the Vandelay employees:
   - They should be able to upload the file from their browser
   - View the results in the browser
   - Be able to download the JSON
   - View the records that are removed
   - Download the records that are removed
1. Combine Duplicate records
   - A duplicate is two records with the same license number
   - When you combine the records, the record with the latest `last update date` is the master and all of the phones and addresses from the other record are **appended** to the master record.
     - For example two records have the same license number (1000545443) but one has the name of George Costanza with an update date of 10-JAN-17 and the other record has the name of Elaine Benes with an update date of 4-JUL-19. Elaine’s record is the most recent. Thus, the resulting record will be named Elaine Benes and all of the addresses and phones from George Costanza will be appended to Elaine’s record. (We know it may seem strange, but just humor us)
     - Report the records that were merged

Was not able to get this far into the challenge itself but I believe the next steps would be for me to create a rails/react app to have a UI for the Vandelay Employees. Since I originally did the other steps in just plain Ruby I would have to figure out how to covert that into rails. The next steps I believe for that would be. 
  - Create Ruby on Rails app and create my database structure 
  - Set up my model/s to have the headings from the CSV file as the data 
  - Set up my controller and API routes to be able to talk to my database 
  - Create React app within the Rails application 
  - Create logic for front end of React to talk to backend of Ruby on Rails
  - Set up UI and ensure all CRUD actions work 
  - Complete what is asked for from the challenge steps 
  - Create method within the model to run a SQL query to find and combine duplicate records so that this is handle all within the backend and automatically when calling for the records 

  I believe this would have been the approach I took when taking on those last 2 challenges. It kinda seems like I would have to restart or maybe I should have done the application with rails/react from the start however I wanted to start with Ruby to ensure I understood how it was done using plain Ruby. I also wanted to follow the instructions by doing the challenges in the order it was listed. 

  # Feedback on the challenge itself

  I did mention before but this is my first take home assessment so I was super excited and stoked to take this on. I was not sure what to expect but the instructions provided in the README were easy to follow. I found the assessment to be very challenging and I feel it did a great job in testing my knowledge on different areas that may be important to Verisys. 
  
  I wish I was able to complete the assessment but I was not able to get that far. In total I worked on the project about 10-11 hrs. I spent the last hour cleaning up my code, ensuring I did not leave any binding.prys or extra white spaces in there. There is a lot of room to grow and improve on my coding skills. I do believe there may be cleaner ways to solve some of the challenges. However I did my best to get it to work in the way I knew how. Defintely a lot of areas to improve on and grow even further. 
  
  Overall the assessment was an amazing experience. Thank you again for giving me this opportunity and I hope I did well enough to hear back from the Verisys team. 