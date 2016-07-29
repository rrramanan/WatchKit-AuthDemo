# WatchKit-AuthDemo
watchOS 3 - User authentication from watch app (Standalone)

<B>Log In Steps</B>
<ul>
<li>Select Mail button to bring textinputcontroller & choose scribble to enter mail ID</li>
<li>Select Pass button to bring textinputcontroller & choose scribble to enter password</li>
<li>Select login button to authenticate</li>
<li>For quick testing I've added correct/incorrect credentials in textinputcontroller suggestions for mail/password</li>
<li>Correct credentials test@mail.com/123</li>
</ul>

![alt Tab](https://github.com/rrramanan/WatchKit-AuthDemo/blob/master/Home.png)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![alt Tab](https://github.com/rrramanan/WatchKit-AuthDemo/blob/master/im1.png)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![alt Tab](https://github.com/rrramanan/WatchKit-AuthDemo/blob/master/im2.png)
<br>

<B>After Login </B><br>
After correct authentication will bring table view enabled with item pagination. Tap a row to move next page & scroll vertical to view rest items. Enable item pagination in table's attributes inspector. Works only with segue.
<br><br>
<B>Logout</B><br>
Force touch in table view to bring logout option.
