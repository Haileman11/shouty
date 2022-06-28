Feature: Hear shout

  Shouty allows users to "hear" other users "shouts" as long as they are close enough to each other.

  Rule: Shouts can be heard by other users

    Scenario: Listener hears a message
      Given a person named Sean
      And a person named Lucy
      When Sean shouts "free bagels at Sean's"
      Then Lucy should hear Sean's message

  Rule: Shouts should only be heard if listener is within range

    Scenario: Listener is within range
      Given the range is 100
      And people are located at 
      |name|location|
      |Sean|0|
      |Lucy|50|      
      When Sean shouts
      Then Lucy should hear a shout

    Scenario: Listener is out of range
      Given the range is 100
      And people are located at 
      |name|location|
      |Sean|0|
      |Larry|150|      
      When Sean shouts
      Then Larry should not hear a shout
  Rule: Listener should be able to hear multiple shouts
    Scenario: Listener hears two shouts
      Given the range is 100
      And a person named Sean
      And a person named Lucy
      When Sean shouts the messages:
      |Free bagels|
      |Free coffee|
      |Free banana|
      Then Lucy should hear the messages:
      |Free bagels|
      |Free coffee|
      |Free banana|
  Rule: Max length is 180 characters
    Scenario: Message is too long
      Given a person named Lucy
      And a person named Sean
      When Sean shouts the message 
      """
      asdasdasdasdj hhdasoihasd iasd ioasdh osida;sodi a;oisd a;osdhao;sd o;iasd ;
      oasidn n;aosi dn;aios n;aosdina; oin;asodna ;
      dn;asdin ;asdn ;aosdn ;as dn; asodinkasdo;hweubf;wef weiufbksLIuekwfhnuthb;ils;n a/
      lsodiheuwygbasdasudb asdaos;idn  ;oaisdna;osidn ;oaisdna;osidn ;aisdn;aosidnasd; n;duweigfb 
      ild nas;ohnas;idb iuasbd ia;sbdu ;aisdb ;asid b;aisbdu ;asasdlbdyasvdlasuyvd
      """
      Then Lucy should not hear a shout