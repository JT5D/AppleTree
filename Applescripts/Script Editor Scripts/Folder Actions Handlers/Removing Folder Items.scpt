FasdUAS 1.101.10   ��   ��    k             l      ��  ��   	
Removing Folder Items

Copyright � 2001�2007 Apple Inc.

You may incorporate this Apple sample code into your program(s) without
restriction.  This Apple sample code has been provided "AS IS" and the
responsibility for its operation is yours.  You are not permitted to
redistribute this Apple sample code as "Apple sample code" after having
made changes.  If you're going to redistribute the code, we require
that you make it clear that the code was descended from Apple sample
code, but that you've made changes.
     � 	 	 
 R e m o v i n g   F o l d e r   I t e m s 
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
 l     ��������  ��  ��        l     ����  r         I    �� ��
�� .sysontocTEXT       shor  m     ���� ��    o      ���� 0 cr CR��  ��        l    ����  r        I   �� ��
�� .sysontocTEXT       shor  m    	���� 
��    o      ���� 0 nl NL��  ��        l     ��������  ��  ��        l   � ����  O    �    O    �     k    � ! !  " # " r     $ % $ m     & & � ' '  - - X X X X % l      (���� ( o      ���� 0 target_string  ��  ��   #  ) * ) l   ��������  ��  ��   *  + , + r    & - . - n    $ / 0 / 1   " $��
�� 
pcnt 0 1    "��
�� 
sele . l      1���� 1 o      ���� 0 selected_text  ��  ��   ,  2 3 2 l  ' '��������  ��  ��   3  4 5 4 Z   ' � 6 7�� 8 6 =  ' * 9 : 9 l  ' ( ;���� ; o   ' (���� 0 selected_text  ��  ��   : m   ( ) < < � = =   7 k   - Z > >  ? @ ? r   - 0 A B A l  - . C���� C o   - .���� 0 target_string  ��  ��   B l      D���� D o      ���� 0 selected_text  ��  ��   @  E F E r   1 4 G H G m   1 2 I I � J J   H l      K���� K o      ���� 0 script_text  ��  ��   F  L M L r   5 < N O N b   5 : P Q P b   5 8 R S R l  5 6 T���� T o   5 6���� 0 script_text  ��  ��   S m   6 7 U U � V V � o n   r e m o v i n g   f o l d e r   i t e m s   f r o m   t h i s _ f o l d e r   a f t e r   l o s i n g   t h e s e _ i t e m s Q o   8 9���� 0 cr CR O l      W���� W o      ���� 0 script_text  ��  ��   M  X Y X r   = H Z [ Z b   = F \ ] \ b   = D ^ _ ^ b   = B ` a ` l  = > b���� b o   = >���� 0 script_text  ��  ��   a 1   > A��
�� 
tab  _ l  B C c���� c o   B C���� 0 selected_text  ��  ��   ] o   D E���� 0 cr CR [ l      d���� d o      ���� 0 script_text  ��  ��   Y  e f e r   I R g h g b   I P i j i b   I N k l k l  I J m���� m o   I J���� 0 script_text  ��  ��   l m   J M n n � o o < e n d   r e m o v i n g   f o l d e r   i t e m s   f r o m j o   N O���� 0 cr CR h l      p���� p o      ���� 0 script_text  ��  ��   f  q�� q r   S Z r s r m   S V t t � u u , - -   i n s e r t   a c t i o n s   h e r e s l      v���� v o      ���� 0 replacement_string  ��  ��  ��  ��   8 k   ] � w w  x y x r   ] b z { z m   ] ` | | � } }   { l      ~���� ~ o      ���� 0 script_text  ��  ��   y   �  r   c l � � � b   c j � � � b   c h � � � l  c d ����� � o   c d���� 0 script_text  ��  ��   � m   d g � � � � � � o n   r e m o v i n g   f o l d e r   i t e m s   f r o m   t h i s _ f o l d e r   a f t e r   l o s i n g   t h e s e _ i t e m s � o   h i���� 0 cr CR � l      ����� � o      ���� 0 script_text  ��  ��   �  � � � Z   m � � ��� � � E  m x � � � J   m q � �  � � � o   m n���� 0 cr CR �  ��� � o   n o���� 0 nl NL��   � n   q w � � � 4  r w�� �
�� 
cha  � m   u v������ � o   q r���� 0 selected_text   � r   { � � � � b   { � � � � b   { � � � � l  { | ����� � o   { |���� 0 script_text  ��  ��   � 1   | ��
�� 
tab  � l  � � ����� � o   � ����� 0 selected_text  ��  ��   � l      ����� � o      ���� 0 script_text  ��  ��  ��   � r   � � � � � b   � � � � � b   � � � � � b   � � � � � l  � � ����� � o   � ����� 0 script_text  ��  ��   � 1   � ���
�� 
tab  � l  � � ����� � o   � ����� 0 selected_text  ��  ��   � o   � ����� 0 cr CR � l      ����� � o      ���� 0 script_text  ��  ��   �  � � � r   � � � � � b   � � � � � b   � � � � � b   � � � � � l  � � ����� � o   � ����� 0 script_text  ��  ��   � m   � � � � � � � < e n d   r e m o v i n g   f o l d e r   i t e m s   f r o m � o   � ����� 0 target_string   � o   � ����� 0 cr CR � l      ����� � o      ���� 0 script_text  ��  ��   �  ��� � r   � � � � � m   � � � � � � �   � l      ����� � o      ���� 0 replacement_string  ��  ��  ��   5  � � � l  � ���~�}�  �~  �}   �  � � � r   � � � � � o   � ��|�| 0 script_text   � n       � � � 1   � ��{
�{ 
pcnt � 1   � ��z
�z 
sele �  � � � l  � ��y�x�w�y  �x  �w   �  � � � Q   � � � ��v � I  � ��u�t�s
�u .sedschksnull���    obj �t  �s   � R      �r�q�p
�r .ascrerr ****      � ****�q  �p  �v   �  � � � l  � ��o�n�m�o  �n  �m   �  � � � n  � � � � � I   � ��l ��k�l 0 replace_and_select   �  � � � o   � ��j�j 0 target_string   �  ��i � o   � ��h�h 0 replacement_string  �i  �k   �  f   � � �  � � � l  � ��g�f�e�g  �f  �e   �  ��d � Q   � � � ��c � I  � ��b�a�`
�b .sedschksnull���    obj �a  �`   � R      �_�^�]
�_ .ascrerr ****      � ****�^  �]  �c  �d     4   �\ �
�\ 
docu � m    �[�[   m     � ��                                                                                  ToyS   alis    �  Leopard9A409Int            �<H+    H�Script Editor.app                                                �p����        ����  	                AppleScript     �<cr      ��j      H�   �  :Leopard9A409Int:Applications:AppleScript:Script Editor.app  $  S c r i p t   E d i t o r . a p p     L e o p a r d 9 A 4 0 9 I n t  *Applications/AppleScript/Script Editor.app  / ��  ��  ��     � � � l     �Z�Y�X�Z  �Y  �X   �  ��W � i      � � � I      �V ��U�V 0 replace_and_select   �  � � � o      �T�T 0 target_string   �  ��S � o      �R�R 0 replacement_string  �S  �U   � O     F � � � O    E � � � k    D � �  � � � r     � � � l    ��Q�P � 1    �O
�O 
pcnt�Q  �P   � o      �N�N 0 	this_text   �  � � � r     � � � l    ��M�L � I   �K�J �
�K .sysooffslong    ��� null�J   � �I � �
�I 
psof � l    ��H�G � o    �F�F 0 target_string  �H  �G   � �E ��D
�E 
psin � o    �C�C 0 	this_text  �D  �M  �L   � o      �B�B 0 this_offset   �  ��A � Z    D � ��@�? � >       o    �>�> 0 this_offset   m    �=�=   � k   # @  r   # 8 7  # 4�<
�< 
cha  o   ( *�;�; 0 this_offset   l  + 3	�:�9	 \   + 3

 [   , 1 o   , -�8�8 0 this_offset   l  - 0�7�6 n   - 0 1   . 0�5
�5 
leng l  - .�4�3 o   - .�2�2 0 target_string  �4  �3  �7  �6   m   1 2�1�1 �:  �9   1   4 7�0
�0 
sele �/ r   9 @ l  9 :�.�- o   9 :�,�, 0 replacement_string  �.  �-   l     �+�* n       1   = ?�)
�) 
pcnt l  : =�(�' 1   : =�&
�& 
sele�(  �'  �+  �*  �/  �@  �?  �A   � l   �%�$ 4   �#
�# 
docu m    �"�" �%  �$   � m     �                                                                                  ToyS   alis    �  Leopard9A409Int            �<H+    H�Script Editor.app                                                �p����        ����  	                AppleScript     �<cr      ��j      H�   �  :Leopard9A409Int:Applications:AppleScript:Script Editor.app  $  S c r i p t   E d i t o r . a p p     L e o p a r d 9 A 4 0 9 I n t  *Applications/AppleScript/Script Editor.app  / ��  �W       �!�!   � ��  0 replace_and_select  
� .aevtoappnull  �   � **** � ��� !�� 0 replace_and_select  � �"� "  ��� 0 target_string  � 0 replacement_string  �    ����� 0 target_string  � 0 replacement_string  � 0 	this_text  � 0 this_offset  ! 
���������
� 
docu
� 
pcnt
� 
psof
� 
psin� 
� .sysooffslong    ��� null
� 
cha 
� 
leng
� 
sele� G� C*�k/ ;*�,E�O*��� E�O�j "*[�\[Z�\Z���,k2*�,FO�*�,�,FY hUU �
#�	�$%�
�
 .aevtoappnull  �   � ****# k     �&&  ''  ((  ��  �	  �  $  % ����� ��  &�������� < I�� U�� n t�� | ��� � ���������� 
� .sysontocTEXT       shor� 0 cr CR� 
� 0 nl NL
�  
docu�� 0 target_string  
�� 
sele
�� 
pcnt�� 0 selected_text  �� 0 script_text  
�� 
tab �� 0 replacement_string  
�� 
cha 
�� .sedschksnull���    obj ��  ��  �� 0 replace_and_select  � ��j E�O�j E�O� �*�k/ ��E�O*�,�,E�O��  2�E�O�E�O��%�%E�O�_ %�%�%E�O�a %�%E�Oa E` Y Ka E�O�a %�%E�O��lv�a i/ �_ %�%E�Y �_ %�%�%E�O�a %�%�%E�Oa E` O�*�,�,FO 
*j W X  hO)�_ l+ O 
*j W X  hUU ascr  ��ޭ