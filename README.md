# rft-sdp-ZAP-SAM
This projet is comprised of web application scanning using OWASP ZAP tool using two methods of scanning i.e. Active and passive.

Active scanning
In active scanning ZAP first accesses the test URL is accessible or not then it spiders(crawls) the URL for pages and forms, it is also having an option for AJAX spider that basically spiders for AJAX calls being made from test URL(this is optional not mandatory). Now in the final step, an active scan is being ran across the test URL, please note that we are supplying context file for the authentication and authorization of the URL in scope(i.e. test URL).
So, basically we are having dependecny on these three files present in repository to run the active scan:
1. Pipeline.yml  This is the main pipeline yml that defines the job and task in concourse CI/CD environment.
2. dast2.yml This yml file basically enlisting all the necessary shell commands required to run the ZAP active scan.
3. .Context file This is an XML file that is containing the instruction for inscope sub-url's, login url, user credentials to carry out an authenticated scan.

Below is the end result summary that we obtain after an actiev scan.
