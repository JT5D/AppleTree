FasdUAS 1.101.10   ��   ��    k             l    � ����  O     �  	  k    � 
 
     l   %     r    %    l      ����  I     ������
�� .misccurdldt    ��� null��  ��  ��  ��    K       ��  
�� 
year  o    ���� 0 y    ��  
�� 
mnth  o   	 
���� 0 m    �� ��
�� 
day   o    ���� 0 d  ��    2 ,extract elements of the date for the title--     �   X e x t r a c t   e l e m e n t s   o f   t h e   d a t e   f o r   t h e   t i t l e - -      l  & 3     r   & 3     c   & 1 ! " ! b   & / # $ # b   & - % & % b   & + ' ( ' b   & ) ) * ) o   & '���� 0 m   * m   ' ( + + � , ,    ( o   ) *���� 0 d   & m   + , - - � . .  ,   $ o   - .���� 0 y   " m   / 0��
�� 
TEXT   o      ���� 0 new_note_title    / )this will be the title of your new note--     � / / R t h i s   w i l l   b e   t h e   t i t l e   o f   y o u r   n e w   n o t e - -   0 1 0 l  4 ; 2 3 4 2 r   4 ; 5 6 5 l  4 9 7���� 7 I  4 9������
�� .misccurdldt    ��� null��  ��  ��  ��   6 o      ���� 0 new_note_date   3 = 7change this to edit the creation date of the new note--    4 � 8 8 n c h a n g e   t h i s   t o   e d i t   t h e   c r e a t i o n   d a t e   o f   t h e   n e w   n o t e - - 1  9 : 9 l  < <��������  ��  ��   :  ; < ; l  < A = > ? = r   < A @ A @ m   < = B B � C C  D a i l y   R e c o r d A o      ���� 0 notebook_name   > T Nthe notebook where your new note will be made & which contains your template--    ? � D D � t h e   n o t e b o o k   w h e r e   y o u r   n e w   n o t e   w i l l   b e   m a d e   &   w h i c h   c o n t a i n s   y o u r   t e m p l a t e - - <  E F E l  B I G H I G r   B I J K J m   B E L L � M M  t e m p l a t e K o      ���� 0 template_tag   H ; 5i assume your template will be tagged as a template--    I � N N j i   a s s u m e   y o u r   t e m p l a t e   w i l l   b e   t a g g e d   a s   a   t e m p l a t e - - F  O P O l  J V Q R S Q r   J V T U T 4   J R�� V
�� 
EVtg V m   N Q W W � X X  d a i l y _ r e c o r d U o      ���� 0 tag1   R ( "a tag to assign to your new note--    S � Y Y D a   t a g   t o   a s s i g n   t o   y o u r   n e w   n o t e - - P  Z [ Z l  W W��������  ��  ��   [  \ ] \ l  W W�� ^ _��   ^ L FThis section extracts the template file & copes its contents as HTML--    _ � ` ` � T h i s   s e c t i o n   e x t r a c t s   t h e   t e m p l a t e   f i l e   &   c o p e s   i t s   c o n t e n t s   a s   H T M L - - ]  a b a r   W n c d c I  W j�� e��
�� .EVRNfindnull���     ctxt e b   W f f g f b   W b h i h b   W ^ j k j m   W Z l l � m m  n o t e b o o k : " k o   Z ]���� 0 notebook_name   i m   ^ a n n � o o  "   t a g : g o   b e���� 0 template_tag  ��   d o      ���� 0 template_list   b  p q p l  o o�� r s��   r  ythe above query must return ONLY the template you're looking for. in this case...'notebook:"Daily Record" tag:template'--    s � t t � t h e   a b o v e   q u e r y   m u s t   r e t u r n   O N L Y   t h e   t e m p l a t e   y o u ' r e   l o o k i n g   f o r .   i n   t h i s   c a s e . . . ' n o t e b o o k : " D a i l y   R e c o r d "   t a g : t e m p l a t e ' - - q  u v u l  o { w x y w r   o { z { z n   o w | } | 4   r w�� ~
�� 
cobj ~ m   u v����  } o   o r���� 0 template_list   { o      ���� 0 template_note   x : 4gets the first matching item of the "find" command--    y �   h g e t s   t h e   f i r s t   m a t c h i n g   i t e m   o f   t h e   " f i n d "   c o m m a n d - - v  � � � l  | � � � � � r   | � � � � n   | � � � � 1    ���
�� 
EVhl � o   | ���� 0 template_note   � o      ���� 0 template_content   � $ grabs the template's content--    � � � � < g r a b s   t h e   t e m p l a t e ' s   c o n t e n t - - �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   �  construct the note--    � � � � ( c o n s t r u c t   t h e   n o t e - - �  � � � r   � � � � � I  � ����� �
�� .EVRNcrntnull��� ��� null��   � �� � �
�� 
Entt � o   � ����� 0 new_note_title   � �� � �
�� 
Enhl � o   � ����� 0 template_content   � �� � �
�� 
Endt � o   � ����� 0 new_note_date   � �� ���
�� 
Ennb � o   � ����� 0 notebook_name  ��   � o      ���� 	0 note1   �  � � � I  � ��� � �
�� .EVRNassnnull���     **** � o   � ����� 0 tag1   � �� ���
�� 
EV13 � o   � ����� 	0 note1  ��   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � F @Open the note in its own editor window & close the main window--    � � � � � O p e n   t h e   n o t e   i n   i t s   o w n   e d i t o r   w i n d o w   &   c l o s e   t h e   m a i n   w i n d o w - - �  � � � I  � ����� �
�� .EVRNonwnnull��� ��� null��   � �� ���
�� 
EV17 � o   � ����� 	0 note1  ��   �  ��� � Z   � � � ����� � I  � ��� ���
�� .coredoexnull���     **** � 4   � ��� �
�� 
cwin � m   � ����� ��   � I  � ��� ���
�� .coreclosnull���     obj  � 4   � ��� �
�� 
cwin � m   � ����� ��  ��  ��  ��   	 m      � ��                                                                                  EVRN  alis    V  Macintosh HD               �0ڲH+   R�Evernote.app                                                   �Q4�(y�        ����  	                Applications    �1�      �(�O     R�  'Macintosh HD:Applications: Evernote.app     E v e r n o t e . a p p    M a c i n t o s h   H D  Applications/Evernote.app   / ��  ��  ��     ��� � l  � � ����� � O  � � � � � r   � � � � � m   � ���
�� boovtrue � n       � � � 1   � ���
�� 
pisf � 4   � ��� �
�� 
prcs � m   � � � � � � �  E v e r n o t e � m   � � � ��                                                                                  sevs  alis    �  Macintosh HD               �0ڲH+   R�System Events.app                                               UK��Ɖ        ����  	                CoreServices    �1�      ���     R� R� R�  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��  ��       �� � ���   � ��
�� .aevtoappnull  �   � **** � �� ����� � ���
�� .aevtoappnull  �   � **** � k     � � �   � �  �����  ��  ��   �   � 0 ������������������� + -������ B�� L���� W�� l n������������������~�}�|�{�z�y�x�w�v�u�t ��s ��r
�� 
Krtn
�� 
year�� 0 y  
�� 
mnth�� 0 m  
�� 
day �� 0 d  �� 
�� .misccurdldt    ��� null
�� 
TEXT�� 0 new_note_title  �� 0 new_note_date  �� 0 notebook_name  �� 0 template_tag  
�� 
EVtg�� 0 tag1  
�� .EVRNfindnull���     ctxt�� 0 template_list  
�� 
cobj�� 0 template_note  
�� 
EVhl�� 0 template_content  
�� 
Entt
�� 
Enhl
� 
Endt
�~ 
Ennb�} 
�| .EVRNcrntnull��� ��� null�{ 	0 note1  
�z 
EV13
�y .EVRNassnnull���     ****
�x 
EV17
�w .EVRNonwnnull��� ��� null
�v 
cwin
�u .coredoexnull���     ****
�t .coreclosnull���     obj 
�s 
prcs
�r 
pisf�� �� �*��������l 	E[�,E�Z[�,E�Z[�,E�ZO��%�%�%�%�&E�O*j 	E�O�E` Oa E` O*a a /E` Oa _ %a %_ %j E` O_ a k/E` O_ a ,E` O*a �a _ a  �a !_ a " #E` $O_ a %_ $l &O*a '_ $l (O*a )l/j * *a )l/j +Y hUOa , e*a -a ./a /,FU ascr  ��ޭ