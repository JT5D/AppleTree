FasdUAS 1.101.10   ��   ��    k             l      ��  ��    
Text Input - 1 Btn

Copyright � 2001�2007 Apple Inc.

You may incorporate this Apple sample code into your program(s) without
restriction.  This Apple sample code has been provided "AS IS" and the
responsibility for its operation is yours.  You are not permitted to
redistribute this Apple sample code as "Apple sample code" after having
made changes.  If you're going to redistribute the code, we require
that you make it clear that the code was descended from Apple sample
code, but that you've made changes.
     � 	 	  
 T e x t   I n p u t   -   1   B t n 
 
 C o p y r i g h t   �   2 0 0 1  2 0 0 7   A p p l e   I n c . 
 
 Y o u   m a y   i n c o r p o r a t e   t h i s   A p p l e   s a m p l e   c o d e   i n t o   y o u r   p r o g r a m ( s )   w i t h o u t 
 r e s t r i c t i o n .     T h i s   A p p l e   s a m p l e   c o d e   h a s   b e e n   p r o v i d e d   " A S   I S "   a n d   t h e 
 r e s p o n s i b i l i t y   f o r   i t s   o p e r a t i o n   i s   y o u r s .     Y o u   a r e   n o t   p e r m i t t e d   t o 
 r e d i s t r i b u t e   t h i s   A p p l e   s a m p l e   c o d e   a s   " A p p l e   s a m p l e   c o d e "   a f t e r   h a v i n g 
 m a d e   c h a n g e s .     I f   y o u ' r e   g o i n g   t o   r e d i s t r i b u t e   t h e   c o d e ,   w e   r e q u i r e 
 t h a t   y o u   m a k e   i t   c l e a r   t h a t   t h e   c o d e   w a s   d e s c e n d e d   f r o m   A p p l e   s a m p l e 
 c o d e ,   b u t   t h a t   y o u ' v e   m a d e   c h a n g e s . 
   
  
 l     ��������  ��  ��        l     ����  r         m        �   
 X - X - X  l      ����  o      ���� 0 target_string  ��  ��  ��  ��        l    ����  r        b        b    	    b        m       �       d i s p l a y   d i a l o g   "  o    ���� 0 target_string    m     ! ! � " " f "   d e f a u l t   a n s w e r   " "   b u t t o n s   { " O K " }   d e f a u l t   b u t t o n   1  o   	 
��
�� 
ret   l      #���� # o      ���� 0 script_text  ��  ��  ��  ��     $ % $ l     ��������  ��  ��   %  & ' & l   y (���� ( O    y ) * ) k    x + +  , - , I   ������
�� .miscactvnull��� ��� null��  ��   -  . / . l   ��������  ��  ��   /  0�� 0 O    x 1 2 1 k    w 3 3  4 5 4 r    & 6 7 6 n    $ 8 9 8 1   " $��
�� 
pcnt 9 1    "��
�� 
sele 7 l      :���� : o      ���� 0 selected_text  ��  ��   5  ; < ; l  ' '��������  ��  ��   <  = > = Z   ' A ? @���� ? >  ' * A B A l  ' ( C���� C o   ' (���� 0 selected_text  ��  ��   B m   ( ) D D � E E   @ Z  - = F G���� F =  - 4 H I H n  - 2 J K J I   . 2�������� 0 display_message  ��  ��   K  f   - . I m   2 3��
�� boovfals G L   7 9 L L m   7 8 M M � N N  u s e r   c a n c e l l e d��  ��  ��  ��   >  O P O l  B B��������  ��  ��   P  Q R Q r   B I S T S l  B C U���� U o   B C���� 0 script_text  ��  ��   T l      V���� V n       W X W 1   F H��
�� 
pcnt X 1   C F��
�� 
sele��  ��   R  Y Z Y l  J J��������  ��  ��   Z  [ \ [ Q   J [ ] ^�� ] I  M R������
�� .sedschksnull���    obj ��  ��   ^ R      ������
�� .ascrerr ****      � ****��  ��  ��   \  _ ` _ l  \ \��������  ��  ��   `  a b a n  \ e c d c I   ] e�� e���� 0 replace_and_select   e  f g f o   ] ^���� 0 target_string   g  h�� h m   ^ a i i � j j  ��  ��   d  f   \ ] b  k l k l  f f��������  ��  ��   l  m�� m Q   f w n o�� n I  i n������
�� .sedschksnull���    obj ��  ��   o R      ������
�� .ascrerr ****      � ****��  ��  ��  ��   2 l    p���� p 4   �� q
�� 
docu q m    ���� ��  ��  ��   * m    ��
�� misccura��  ��   '  r s r l     ��������  ��  ��   s  t u t i      v w v I      �������� 0 display_message  ��  ��   w k     = x x  y z y I    �� { |
�� .sysodlogaskr        TEXT { b      } ~ } b       �  b      � � � m      � � � � � T T h i s   s c r i p t   w i l l   d e l e t e   t h e   s e l e c t e d   t e x t . � o    ��
�� 
ret  � o    ��
�� 
ret  ~ m     � � � � � 0 D o   y o u   w a n t   t o   c o n t i n u e ? | �� � �
�� 
btns � J     � �  � � � m    	 � � � � �  H e l p �  � � � m   	 
 � � � � �  C o n t i n u e �  ��� � m   
  � � � � �  S t o p��   � �� � �
�� 
dflt � m    ����  � �� ���
�� 
disp � m    ���� ��   z  � � � r     � � � l    ����� � n     � � � 1    ��
�� 
bhit � l    ����� � 1    ��
�� 
rslt��  ��  ��  ��   � l      ����� � o      ���� 0 user_choice  ��  ��   �  ��� � Z    = � � � � � =    � � � l    ����� � o    ���� 0 user_choice  ��  ��   � m     � � � � �  H e l p � k   " + � �  � � � n  " ( � � � I   # (�� ����� 0 script_help   �  ��� � m   # $ � � � � �  S c r i p t E d i t o r 0 0 1��  ��   �  f   " # �  ��� � L   ) + � � m   ) *��
�� boovfals��   �  � � � =  . 3 � � � l  . / ����� � o   . /���� 0 user_choice  ��  ��   � m   / 2 � � � � �  S t o p �  �� � L   6 8 � � m   6 7�~
�~ boovfals�   � L   ; = � � m   ; <�}
�} boovtrue��   u  � � � l     �|�{�z�|  �{  �z   �  � � � i     � � � I      �y ��x�y 0 script_help   �  ��w � o      �v�v 0 this_anchor  �w  �x   � P     $ ��u � � O    # � � � k   	 " � �  � � � I  	 �t�s�r
�t .miscactvnull��� ��� null�s  �r   �  ��q � Q    " � ��p � I   �o � �
�o .helpsancnull���    obj  � o    �n�n 0 this_anchor   � �m ��l
�m 
sstr � m     � � � � � $ S c r i p t   E d i t o r   H e l p�l   � R      �k�j�i
�k .ascrerr ****      � ****�j  �i  �p  �q   � m     � ��                                                                                  hbwr   alis    �  Leopard9A409Int            �<H+     {Help Viewer.app                                                  _Q�+��        ����  	                CoreServices    �<cr      �,       {   @   ?  ;Leopard9A409Int:System:Library:CoreServices:Help Viewer.app      H e l p   V i e w e r . a p p     L e o p a r d 9 A 4 0 9 I n t  +System/Library/CoreServices/Help Viewer.app   / ��  �u   � �h�g
�h consrmte�g   �  � � � l     �f�e�d�f  �e  �d   �  ��c � i     � � � I      �b ��a�b 0 replace_and_select   �  � � � o      �`�` 0 target_string   �  ��_ � o      �^�^ 0 replacement_string  �_  �a   � O     F � � � O    E � � � k    D � �  � � � r     � � � l    ��]�\ � 1    �[
�[ 
pcnt�]  �\   � o      �Z�Z 0 	this_text   �  � � � r     � � � l    ��Y�X � I   �W�V �
�W .sysooffslong    ��� null�V   � �U � �
�U 
psof � l    ��T�S � o    �R�R 0 target_string  �T  �S   � �Q ��P
�Q 
psin � o    �O�O 0 	this_text  �P  �Y  �X   � o      �N�N 0 this_offset   �  ��M � Z    D � ��L�K � >     � � � o    �J�J 0 this_offset   � m    �I�I   � k   # @ � �  � � � r   # 8 � � � 7  # 4�H � 
�H 
cha  � o   ( *�G�G 0 this_offset    l  + 3�F�E \   + 3 [   , 1 o   , -�D�D 0 this_offset   l  - 0�C�B n   - 0 1   . 0�A
�A 
leng l  - .	�@�?	 o   - .�>�> 0 target_string  �@  �?  �C  �B   m   1 2�=�= �F  �E   � 1   4 7�<
�< 
sele � 
�;
 r   9 @ l  9 :�:�9 o   9 :�8�8 0 replacement_string  �:  �9   l     �7�6 n       1   = ?�5
�5 
pcnt l  : =�4�3 1   : =�2
�2 
sele�4  �3  �7  �6  �;  �L  �K  �M   � l   �1�0 4   �/
�/ 
docu m    �.�. �1  �0   � m     �-
�- misccura�c       �,�,   �+�*�)�(�+ 0 display_message  �* 0 script_help  �) 0 replace_and_select  
�( .aevtoappnull  �   � **** �' w�&�%�$�' 0 display_message  �&  �%   �#�# 0 user_choice    ��" ��! � � �� ����� � �� �
�" 
ret 
�! 
btns
�  
dflt
� 
disp� 
� .sysodlogaskr        TEXT
� 
rslt
� 
bhit� 0 script_help  �$ >��%�%�%����mv�m�l� 
O��,E�O��  )�k+ OfY �a   fY e � ����� 0 script_help  � ��   �� 0 this_anchor  �   �� 0 this_anchor    � ��� ����
� .miscactvnull��� ��� null
� 
sstr
� .helpsancnull���    obj �  �  � %g� !� *j O ���l W X  hUV � ����
� 0 replace_and_select  � �	 �	    ��� 0 target_string  � 0 replacement_string  �   ����� 0 target_string  � 0 replacement_string  � 0 	this_text  � 0 this_offset   
��� ��������������
� misccura
� 
docu
�  
pcnt
�� 
psof
�� 
psin�� 
�� .sysooffslong    ��� null
�� 
cha 
�� 
leng
�� 
sele�
 G� C*�k/ ;*�,E�O*��� E�O�j "*[�\[Z�\Z���,k2*�,FO�*�,�,FY hUU ��!����"#��
�� .aevtoappnull  �   � ****! k     y$$  %%  &&  &����  ��  ��  "  #  ��  !���������������� D�� M������ i���� 0 target_string  
�� 
ret �� 0 script_text  
�� misccura
�� .miscactvnull��� ��� null
�� 
docu
�� 
sele
�� 
pcnt�� 0 selected_text  �� 0 display_message  
�� .sedschksnull���    obj ��  ��  �� 0 replace_and_select  �� z�E�O��%�%�%E�O� h*j O*�k/ Z*�,�,E�O�� )j+ f  �Y hY hO�*�,�,FO 
*j W X  hO)�a l+ O 
*j W X  hUU ascr  ��ޭ