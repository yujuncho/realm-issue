# realm-issue

This project was created to demonstrate a potential issue with Realm or Swift.
The issue may also come from incorrect setup, in which case this project should be updated to reflect the correct
method of creating a project with similar needs.

# explanation

It is likely that the issue comes from the inhritance setup. After creating a ModelInherit RLMObject, retrieving the
the <object> produces unexpected behavior. The <object> exists and executing print(<object>.description) works; however
simply calling print(<object>) does not work. Another odd outcome is that after casting the <object> from AnyObject to
ModelInherit, the _deletedFromRealm variable switches from NO to YES.

Below is an illustration of the described behaviors

![alt tag](http://imgur.com/BuQq9DL)
