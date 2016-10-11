# ios_mockup
## Usage

After download and setup all necessary SDKs, run:

Next, open TaxationProject.xcworkspace in XCode (not  TaxationProject.xcodeproj, since you need to include the Cocoapod dependencies).

#### Initial View 

The initial view of application consist of Login and Register button. For registration or login tap accordingly.

#### Registration View

For registration user should fill the fields of Name , Email , Password , ConfirmPassword , Birthyear and Birthmonth.
The fields should not empty ,format of mail is correct and password should match with the confirmpassword if so then alert view will pop-up on the screen to guide user accordingly.After successful registration we get the success message and an email to verify your account is sent to you.Verifying your account is important otherwise you cannot registered your account.We have clicked on the verification link; our email is verified and user is registerd and login screen is appeared.
If user already registered the it will goes back to initial view with swipe right.

#### Login View

For login user should fill the UserName and Password field on screen.
If the user is already registered then screen of Earnings will be appear else alert view pop-up of User is not registered .
The field should not empty and if user is not registered already then user can move to initial view by doing swipe right. 

