FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ("
Get Source of Selected Messages

Copyright � 2003�2013 Apple Inc. All rights reserved.

You may incorporate this Apple sample code into your program(s) without
restriction.  This Apple sample code has been provided "AS IS" and the
responsibility for its operation is yours.  You are not permitted to
redistribute this Apple sample code as "Apple sample code" after having
made changes.  If you're going to redistribute the code, we require that
you make it clear that the code was descended from Apple sample code,
but that you've made changes.
     � 	 	D 
 G e t   S o u r c e   o f   S e l e c t e d   M e s s a g e s 
 
 C o p y r i g h t   �   2 0 0 3  2 0 1 3   A p p l e   I n c .   A l l   r i g h t s   r e s e r v e d . 
 
 Y o u   m a y   i n c o r p o r a t e   t h i s   A p p l e   s a m p l e   c o d e   i n t o   y o u r   p r o g r a m ( s )   w i t h o u t 
 r e s t r i c t i o n .     T h i s   A p p l e   s a m p l e   c o d e   h a s   b e e n   p r o v i d e d   " A S   I S "   a n d   t h e 
 r e s p o n s i b i l i t y   f o r   i t s   o p e r a t i o n   i s   y o u r s .     Y o u   a r e   n o t   p e r m i t t e d   t o 
 r e d i s t r i b u t e   t h i s   A p p l e   s a m p l e   c o d e   a s   " A p p l e   s a m p l e   c o d e "   a f t e r   h a v i n g 
 m a d e   c h a n g e s .     I f   y o u ' r e   g o i n g   t o   r e d i s t r i b u t e   t h e   c o d e ,   w e   r e q u i r e   t h a t 
 y o u   m a k e   i t   c l e a r   t h a t   t h e   c o d e   w a s   d e s c e n d e d   f r o m   A p p l e   s a m p l e   c o d e , 
 b u t   t h a t   y o u ' v e   m a d e   c h a n g e s . 
   
  
 l     ��������  ��  ��        l      ��  ��    t n
This script creates a new message with the raw message source of the
first selected message as its contents.
     �   � 
 T h i s   s c r i p t   c r e a t e s   a   n e w   m e s s a g e   w i t h   t h e   r a w   m e s s a g e   s o u r c e   o f   t h e 
 f i r s t   s e l e c t e d   m e s s a g e   a s   i t s   c o n t e n t s . 
      l     ��������  ��  ��     ��  l    X ����  O     X    k    W       r    	    1    ��
�� 
slct  o      ���� $0 selectedmessages selectedMessages   ��  Z   
 W  ��   =  
    !   l  
  "���� " I  
 �� #��
�� .corecnte****       **** # o   
 ���� $0 selectedmessages selectedMessages��  ��  ��   ! m    ����    I   �� $ %
�� .sysodisAaleR        TEXT $ m     & & � ' ' ( N o   M e s s a g e s   S e l e c t e d % �� (��
�� 
mesS ( m     ) ) � * * � S e l e c t   t h e   m e s s a g e   y o u   w a n t   t o   g e t   t h e   r a w   s o u r c e   o f   b e f o r e   r u n n i n g   t h i s   s c r i p t .��  ��    k    W + +  , - , r    $ . / . n    " 0 1 0 4    "�� 2
�� 
cobj 2 m     !����  1 o    ���� $0 selectedmessages selectedMessages / o      ���� 0 
themessage 
theMessage -  3 4 3 r   % * 5 6 5 n   % ( 7 8 7 1   & (��
�� 
raso 8 o   % &���� 0 
themessage 
theMessage 6 o      ���� 0 	thesource 	theSource 4  9 : 9 r   + 4 ; < ; b   + 2 = > = b   + 0 ? @ ? m   + , A A � B B . R a w   s o u r c e   o f   m e s s a g e   ( @ l  , / C���� C n   , / D E D 1   - /��
�� 
subj E o   , -���� 0 
themessage 
theMessage��  ��   > m   0 1 F F � G G  ) < o      ���� 0 
thesubject 
theSubject :  H I H l  5 5��������  ��  ��   I  J�� J r   5 W K L K I  5 S���� M
�� .corecrel****      � null��   M �� N O
�� 
kocl N m   9 <��
�� 
bcke O �� P��
�� 
prdt P K   ? M Q Q �� R S
�� 
subj R o   @ A���� 0 
thesubject 
theSubject S �� T U
�� 
ctnt T o   D E���� 0 	thesource 	theSource U �� V��
�� 
pvis V m   H I��
�� boovtrue��  ��   L o      ���� 0 
newmessage 
newMessage��  ��    m      W W�                                                                                  emal  alis    F  MountainLion               �ofeH+     MMail.app                                                        [p���        ����  	                Applications    �o��      �h       M  #MountainLion:Applications: Mail.app     M a i l . a p p    M o u n t a i n L i o n  Applications/Mail.app   / ��  ��  ��  ��       �� X Y��   X ��
�� .aevtoappnull  �   � **** Y �� Z���� [ \��
�� .aevtoappnull  �   � **** Z k     X ] ]  ����  ��  ��   [   \  W������ &�� )���������� A�� F��������������������
�� 
slct�� $0 selectedmessages selectedMessages
�� .corecnte****       ****
�� 
mesS
�� .sysodisAaleR        TEXT
�� 
cobj�� 0 
themessage 
theMessage
�� 
raso�� 0 	thesource 	theSource
�� 
subj�� 0 
thesubject 
theSubject
�� 
kocl
�� 
bcke
�� 
prdt
�� 
ctnt
�� 
pvis�� �� 
�� .corecrel****      � null�� 0 
newmessage 
newMessage�� Y� U*�,E�O�j j  ���l Y ;��k/E�O��,E�O���,%�%E�O*a a a ��a �a ea a  E` Uascr  ��ޭ