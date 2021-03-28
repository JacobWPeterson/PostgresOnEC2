# How to Contribute

If you see issues or want to offer suggestions for improvement, please open a new issue.

If you'd like to add setup instructions for other DBMS (e.g. mySQL or MongoDB) feel free to submit a pull request. See guidelines below.

## Submitting Changes

Please submit a pull request with a clear list of what you've done (read more about [pull requests](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request). Please follow the formatting conventions (below) and make sure all of your commits are complete.

Always write a clear log message for your commits. One-line messages are fine for small changes, but bigger changes should look like this:

    $ git commit -m "A brief summary of the commit
    > 
    > A paragraph describing what changed and its impact."

## Conventions

Start by reading the postgresqlSetup.sh to get a feel for format. We optimize for readability and also clarity for new programmers:

  * File naming convention is the DBMS name in camelCase followed by `Setup.sh` (e.g. mySQLSetup.sh or mongoDBSetup.sh)
  * Wrap your lines so a reader does not have to scroll horizontally
  * File should begin at installation of DBMS
  * Explain your steps with comments; many shell commands are unintelligible to new programmers
  * Reference official documentation when adjusting DBMS configuration settings

Thanks,
Jacob Peterson
