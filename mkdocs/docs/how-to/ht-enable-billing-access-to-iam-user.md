# How-To: Enable billing access to an IAM user


1. Using the root user, open the account settings. This is in the dropdown menu with the root username in the upper right corner.

2. Scroll down until you see the "IAM user and role access to Billing information" section.

3. Click the edit button, and tick the "Activate IAM access" box. Then update.

4. Now go to the IAM service in AWS. Then click on "Users" in the left sidebar.

5. Find the user, and click the name. 

6. Go to the "Permission Policies" section. Check if the user has "AdministratorAccess" policy. If yes, then no need to proceed to the next steps. 

7. You can grant a limited policy to the user to, say, just to have a read access to the Billing section. Click on the "Add permissions" button, and select "Add permission".

8. In the **Permission Options** section, select *Attach policies directly*. Search for "AWSBillingReadOnlyAccess" then tick the box next to it. Click "Next". Then "Add permissions".

9. Log-in to the IAM user, then check if the user can read the Billing console.
