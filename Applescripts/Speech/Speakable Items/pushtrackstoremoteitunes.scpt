FasdUAS 1.101.10   ��   ��    k             j     �� ��  0 defaultsdomain defaultsDomain  m        � 	 	 4 c o m . d o u g s c r i p t s . c o p y s h a r e d   
  
 l     ��������  ��  ��        p       �� �� 0 remusername remUserName  �� �� 0 remhostipaddr remHostIPAddr  ������ 0 remaddr remAddr��        p       �� �� 0 sel    �� �� 0 sharedlibname sharedLibName  �� �� 0 playlistname playlistName  ������ 0 playpid playPid��        l     ��������  ��  ��        l   . ����  O    .    k   -        r    	 ! " ! 1    ��
�� 
sele " o      ���� 0 sel      # $ # Z   
 V % &�� ' % =  
  ( ) ( o   
 ���� 0 sel   ) J    ����   & k    ! * *  + , + I   �� - .
�� .sysodlogaskr        TEXT - m     / / � 0 0 & N o   t r a c k s   s e l e c t e d . . �� 1 2
�� 
btns 1 J     3 3  4�� 4 m     5 5 � 6 6  C a n c e l��   2 �� 7 8
�� 
dflt 7 m    ����  8 �� 9��
�� 
disp 9 m    ����  ��   ,  :�� : L    !����  ��  ��   ' k   $ V ; ;  < = < r   $ * > ? > n   $ ( @ A @ 4   % (�� B
�� 
cobj B m   & '����  A o   $ %���� 0 sel   ? o      ���� 0 t1   =  C�� C Z   + V D E�� F D l  + 0 G���� G e   + 0 H H =  + 0 I J I n   + . K L K m   , .��
�� 
pcls L o   + ,���� 0 t1   J m   . /��
�� 
cShT��  ��   E r   3 ? M N M l  3 ; O���� O e   3 ; P P n   3 ; Q R Q 1   8 :��
�� 
pnam R n   3 8 S T S 1   6 8��
�� 
ctnr T n   3 6 U V U 1   4 6��
�� 
ctnr V o   3 4���� 0 t1  ��  ��   N o      ���� 0 sharedlibname sharedLibName��   F k   B V W W  X Y X I  B S�� Z [
�� .sysodlogaskr        TEXT Z m   B E \ \ � ] ] 4 N o   s h a r e d   t r a c k s   s e l e c t e d . [ �� ^ _
�� 
btns ^ J   F K ` `  a�� a m   F I b b � c c  C a n c e l��   _ �� d e
�� 
dflt d m   L M����  e �� f��
�� 
disp f m   N O����  ��   Y  g�� g L   T V����  ��  ��   $  h i h l  W W��������  ��  ��   i  j k j n  W \ l m l I   X \�������� 0 get_login_info  ��  ��   m  f   W X k  n o n l  ] ]��������  ��  ��   o  p q p l  ] ]�� r s��   r ) # == get a name for the new playlist    s � t t F   = =   g e t   a   n a m e   f o r   t h e   n e w   p l a y l i s t q  u v u r   ] d w x w m   ] ` y y � z z   x o      ���� 0 playlistname playlistName v  { | { r   e | } ~ } c   e x  �  l  e t ����� � b   e t � � � b   e n � � � n  e j � � � 1   f j��
�� 
pArt � o   e f���� 0 t1   � m   j m � � � � �    -   � n  n s � � � 1   o s��
�� 
pAlb � o   n o���� 0 t1  ��  ��   � m   t w��
�� 
ctxt ~ o      ���� 0 defans defAns |  � � � r   } � � � � l  } � ����� � I  } ��� � �
�� .sysodlogaskr        TEXT � m   } � � � � � � B P u t   n e w   t r a c k s   i n   p l a y l i s t   n a m e d : � �� � �
�� 
dtxt � o   � ����� 0 defans defAns � �� � �
�� 
btns � J   � � � �  � � � m   � � � � � � �  C a n c e l �  ��� � m   � � � � � � �  O K��   � �� ���
�� 
dflt � m   � ����� ��  ��  ��   � o      ���� 0 ddresult ddResult �  � � � Z   � � � ��� � � F   � � � � � >  � � � � � n   � � � � � 1   � ���
�� 
ttxt � o   � ����� 0 ddresult ddResult � m   � � � � � � �   � =  � � � � � n   � � � � � 1   � ���
�� 
bhit � o   � ����� 0 ddresult ddResult � m   � � � � � � �  O K � r   � � � � � n  � � � � � I   � ��� ����� 0 escape_single_quotes   �  ��� � n   � � � � � 1   � ���
�� 
ttxt � o   � ����� 0 ddresult ddResult��  ��   �  f   � � � o      ���� 0 playlistname playlistName��   � l  � � � � � � L   � �����   � - ' (will cancel on empty string returned)    � � � � N   ( w i l l   c a n c e l   o n   e m p t y   s t r i n g   r e t u r n e d ) �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � H B == make remote playlist, get pid, pass to track routine as global    � � � � �   = =   m a k e   r e m o t e   p l a y l i s t ,   g e t   p i d ,   p a s s   t o   t r a c k   r o u t i n e   a s   g l o b a l �  � � � Z   � � � ����� � =  � � � � � n  � � � � � I   � ��������� 0 make_rem_playlist  ��  ��   �  f   � � � m   � ���
�� boovfals � k   � � � �  � � � I  � ��� � �
�� .sysodlogaskr        TEXT � b   � � � � � o   � ���
�� 
ret  � m   � � � � � � � B U n a b l e   t o   c r e a t e   r e m o t e   p l a y l i s t . � �� � �
�� 
btns � J   � � � �  ��� � m   � � � � � � �  C a n c e l��   � �� � �
�� 
dflt � m   � �����  � �� � �
�� 
disp � m   � �����   � �� ���
�� 
givu � m   � ����� ��   �  ��� � L   � �����  ��  ��  ��   �  � � � l  � �����~��  �  �~   �  � � � l  � ��} � ��}   � - ' == copy the tracks to the new playlist    � � � � N   = =   c o p y   t h e   t r a c k s   t o   t h e   n e w   p l a y l i s t �  ��| � X   �- ��{ � � Q  ( � ��z � n  � � � I  �y ��x�y 0 dupe_to_new_playlist   �  ��w � e   � � n  � � � 1  �v
�v 
pPIS � o  �u�u 0 t  �w  �x   �  f   � R      �t�s�r
�t .ascrerr ****      � ****�s  �r  �z  �{ 0 t   � o  �q�q 0 sel  �|    m      � ��                                                                                  hook  alis    N  Macintosh HD               �0ڲH+   R�
iTunes.app                                                      U�����2        ����  	                Applications    �1�      ��r     R�  %Macintosh HD:Applications: iTunes.app    
 i T u n e s . a p p    M a c i n t o s h   H D  Applications/iTunes.app   / ��  ��  ��     � � � l     �p�o�n�p  �o  �n   �  � � � l     �m � ��m   �   == end run    � � � �    = =   e n d   r u n �    l     �l�k�j�l  �k  �j    l     �i�i     == handlers = == == ==    � .   = =   h a n d l e r s   =   = =   = =   = =  i   	
	 I      �h�g�f�h 0 make_rem_playlist  �g  �f  
 Q     ' k      r     n    
 1    
�e
�e 
strq l   �d�c b     b     m     � � o s a s c r i p t   - e   ' t e l l   a p p l i c a t i o n   " i T u n e s " '   - e   ' r e t u r n   p e r s i s t e n t   i d   o f   ( m a k e   u s e r   p l a y l i s t   w i t h   p r o p e r t i e s   { n a m e : " o    �b�b 0 playlistname playlistName m     � $ " } ) '   - e   ' e n d   t e l l '�d  �c   o      �a�a 0 osacom osaCom  r     !  l   "�`�_" I   �^#�]
�^ .sysoexecTEXT���     TEXT# l   $�\�[$ b    %&% b    '(' b    )*) m    ++ �,,  s s h  * o    �Z�Z 0 remaddr remAddr( 1    �Y
�Y 
spac& o    �X�X 0 osacom osaCom�\  �[  �]  �`  �_  ! o      �W�W 0 playpid playPid -�V- L    .. m    �U
�U boovtrue�V   R      �T�S�R
�T .ascrerr ****      � ****�S  �R   L   % '// m   % &�Q
�Q boovfals 010 l     �P�O�N�P  �O  �N  1 232 i   
454 I      �M6�L�M 0 dupe_to_new_playlist  6 7�K7 o      �J�J 0 pid  �K  �L  5 Q     489:8 t    !;<; k     == >?> r    @A@ n    BCB 1    �I
�I 
strqC l   D�H�GD b    EFE b    GHG b    IJI b    
KLK m    MM �NN � o s a s c r i p t   - e   ' t e l l   a p p l i c a t i o n   " i T u n e s " '   - e   ' d u p l i c a t e   ( s o m e   t r a c k   o f   l i b r a r y   p l a y l i s t   1   w h o s e   p e r s i s t e n t   i d   i s   "L o    	�F�F 0 pid  J m   
 OO �PP X " )   t o   s o m e   p l a y l i s t   w h o s e   p e r s i s t e n t   i d   i s   "H o    �E�E 0 playpid playPidF m    QQ �RR   " '   - e   ' e n d   t e l l '�H  �G  A o      �D�D 0 osacom osaCom? S�CS I    �BT�A
�B .sysoexecTEXT���     TEXTT l   U�@�?U b    VWV b    XYX b    Z[Z m    \\ �]]  s s h  [ o    �>�> 0 remaddr remAddrY 1    �=
�= 
spacW o    �<�< 0 osacom osaCom�@  �?  �A  �C  < l   ^�;�:^ ]    _`_ m    �9�9 ` 1    �8
�8 
days�;  �:  9 R      �7ab
�7 .ascrerr ****      � ****a o      �6�6 0 m  b �5c�4
�5 
errnc o      �3�3 0 n  �4  : k   ) 4dd efe I  ) .�2g�1
�2 .ascrcmnt****      � ****g o   ) *�0�0 0 m  �1  f h�/h I  / 4�.i�-
�. .ascrcmnt****      � ****i o   / 0�,�, 0 n  �-  �/  3 jkj l     �+�*�)�+  �*  �)  k lml i   non I      �(�'�&�( 0 get_login_info  �'  �&  o k     �pp qrq Q     nstus r    vwv n   	xyx I    	�%z�$�% 0 read_defaults  z {�#{ o    �"�" 0 sharedlibname sharedLibName�#  �$  y  f    w J      || }~} o      �!�! 0 remusername remUserName~ �  o      �� 0 remhostipaddr remHostIPAddr�   t R      ���
� .ascrerr ****      � ****� o      �� 0 m  � ���
� 
errn� o      �� 0 n  �  u Z     n����� E    &��� J     $�� ��� m     !�� � ��� m   ! "���@�  � o   $ %�� 0 n  � k   ) U�� ��� l  ) )����  � %  get username for sharedLibName   � ��� >   g e t   u s e r n a m e   f o r   s h a r e d L i b N a m e� ��� r   ) 8��� n   ) 6��� 1   4 6�
� 
ttxt� l  ) 4���� I  ) 4���
� .sysodlogaskr        TEXT� b   ) .��� b   ) ,��� m   ) *�� ��� n E n t e r   t h e   u s e r n a m e   a s s o c i a t e d   w i t h   t h e   s h a r e d   l i b r a r y   "� o   * +�� 0 sharedlibname sharedLibName� m   , -�� ���  " :� ���
� 
dtxt� m   / 0�� ���  �  �  �  � o      �� 0 remusername remUserName� ��� l  9 9��
�	�  �
  �	  � ��� l  9 9����  � ' ! get ip address for sharedLibName   � ��� B   g e t   i p   a d d r e s s   f o r   s h a r e d L i b N a m e� ��� r   9 J��� n   9 H��� 1   F H�
� 
ttxt� l  9 F���� I  9 F���
� .sysodlogaskr        TEXT� b   9 >��� b   9 <��� m   9 :�� ��� r E n t e r   t h e   I P   a d d r e s s   a s s o c i a t e d   w i t h   t h e   s h a r e d   l i b r a r y   "� o   : ;�� 0 sharedlibname sharedLibName� m   < =�� ���  " :� ���
� 
dtxt� m   ? B�� ���  �  �  �  � o      � �  0 remhostipaddr remHostIPAddr� ��� l  K K��������  ��  ��  � ���� n  K U��� I   L U������� 0 write_defaults  � ��� o   L M���� 0 sharedlibname sharedLibName� ���� J   M Q�� ��� o   M N���� 0 remusername remUserName� ���� o   N O���� 0 remhostipaddr remHostIPAddr��  ��  ��  �  f   K L��  �  � k   X n�� ��� l  X X������  �   some other error; abort   � ��� 0   s o m e   o t h e r   e r r o r ;   a b o r t� ��� I  X ]�����
�� .ascrcmnt****      � ****� o   X Y���� 0 m  ��  � ��� I  ^ c�����
�� .ascrcmnt****      � ****� o   ^ _���� 0 n  ��  � ���� R   d n�����
�� .ascrerr ****      � ****��  � �����
�� 
errn� m   h k��������  ��  r ��� l  o o��������  ��  ��  � ��� r   o ~��� c   o z��� l  o v������ b   o v��� b   o t��� o   o p���� 0 remusername remUserName� m   p s�� ���  @� o   t u���� 0 remhostipaddr remHostIPAddr��  ��  � m   v y��
�� 
ctxt� o      ���� 0 remaddr remAddr� ���� l   ��������  ��  ��  ��  m ��� l     ��������  ��  ��  � ��� i    ��� I      ������� 0 write_defaults  � ��� o      ���� 0 k  � ���� o      ���� 0 l  ��  ��  � I    �����
�� .sysoexecTEXT���     TEXT� b     ��� b     ��� b     ��� b     	��� b        m      �  d e f a u l t s   w r i t e   o    ����  0 defaultsdomain defaultsDomain� 1    ��
�� 
spac� n   	  1   
 ��
�� 
strq o   	 
���� 0 k  � m     �    - a r r a y  � l   ���� b    	
	 b     l   ���� m     �  '��  ��   n    I    ������ 0 list_to_text    o    ���� 0 l   �� m     �  '   '��  ��    f    
 l   ���� m     �  '��  ��  ��  ��  ��  �  l     ��������  ��  ��    i      I      ��!���� 0 read_defaults  ! "��" o      ���� 0 k  ��  ��    L     ## n     $%$ 2   ��
�� 
cpar% l    &����& I    ��'��
�� .sysoexecTEXT���     TEXT' l    (����( b     )*) b     +,+ l    -����- b     ./. b     	010 b     232 m     44 �55  d e f a u l t s   r e a d  3 o    ����  0 defaultsdomain defaultsDomain1 1    ��
�� 
spac/ n   	 676 1   
 ��
�� 
strq7 o   	 
���� 0 k  ��  ��  , 1    ��
�� 
spac* m    88 �99 b |   g r e p   '   ' | s e d   - e   ' s /   / / g '   - e ' s / " / / g '   - e ' s / \ , / / g '��  ��  ��  ��  ��   :;: l     ��������  ��  ��  ; <=< i   >?> I      ��@���� 0 escape_single_quotes  @ A��A o      ���� 0 x  ��  ��  ? L     BB c     
CDC n    EFE I    ��G���� 0 replace_chars  G HIH o    ���� 0 x  I JKJ m    LL �MM  'K N��N m    OO �PP  ' \ ' '��  ��  F  f     D m    	��
�� 
ctxt= QRQ l     ��������  ��  ��  R STS i    UVU I      ��W���� 0 replace_chars  W XYX o      ���� 0 txt  Y Z[Z o      ���� 0 srch  [ \��\ o      ���� 0 repl  ��  ��  V k      ]] ^_^ r     `a` l    b����b o     ���� 0 srch  ��  ��  a n     cdc 1    ��
�� 
txdld 1    ��
�� 
ascr_ efe r    ghg n    	iji 2    	��
�� 
citmj o    ���� 0 txt  h l     k����k o      ���� 0 	item_list  ��  ��  f lml r    non l   p����p o    ���� 0 repl  ��  ��  o n     qrq 1    ��
�� 
txdlr 1    ��
�� 
ascrm sts r    uvu c    wxw l   y����y o    ���� 0 	item_list  ��  ��  x m    ��
�� 
TEXTv o      ���� 0 txt  t z{z r    |}| m    ~~ �  } n     ��� 1    ��
�� 
txdl� 1    ��
�� 
ascr{ ���� L     �� o    ���� 0 txt  ��  T ��� l     ����~��  �  �~  � ��}� i    "��� I      �|��{�| 0 list_to_text  � ��� o      �z�z 0 thelist theList� ��y� o      �x�x 	0 delim  �y  �{  � k     3�� ��� r     ��� n    ��� 1    �w
�w 
txdl� 1     �v
�v 
ascr� o      �u�u 0 saved saveD� ��� Q    *���� k   	 �� ��� r   	 ��� J   	 �� ��t� o   	 
�s�s 	0 delim  �t  � n     ��� 1    �r
�r 
txdl� 1    �q
�q 
ascr� ��p� r    ��� c    ��� o    �o�o 0 thelist theList� m    �n
�n 
ctxt� o      �m�m 0 txt  �p  � R      �l��
�l .ascrerr ****      � ****� o      �k�k 0 errstr errStr� �j��i
�j 
errn� o      �h�h 0 errnum errNum�i  � k    *�� ��� r    #��� o    �g�g 0 saved saveD� n     ��� 1     "�f
�f 
txdl� 1     �e
�e 
ascr� ��d� R   $ *�c��
�c .ascrerr ****      � ****� o   ( )�b�b 0 errstr errStr� �a��`
�a 
errn� o   & '�_�_ 0 errnum errNum�`  �d  � ��� r   + 0��� o   + ,�^�^ 0 saved saveD� n     ��� 1   - /�]
�] 
txdl� 1   , -�\
�\ 
ascr� ��[� L   1 3�� l  1 2��Z�Y� o   1 2�X�X 0 txt  �Z  �Y  �[  �}       �W� ����������W  � 
�V�U�T�S�R�Q�P�O�N�M�V  0 defaultsdomain defaultsDomain�U 0 make_rem_playlist  �T 0 dupe_to_new_playlist  �S 0 get_login_info  �R 0 write_defaults  �Q 0 read_defaults  �P 0 escape_single_quotes  �O 0 replace_chars  �N 0 list_to_text  
�M .aevtoappnull  �   � ****� �L
�K�J���I�L 0 make_rem_playlist  �K  �J  � �H�H 0 osacom osaCom� �G�F+�E�D�C�B�A�@�G 0 playlistname playlistName
�F 
strq�E 0 remaddr remAddr
�D 
spac
�C .sysoexecTEXT���     TEXT�B 0 playpid playPid�A  �@  �I ( ��%�%�,E�O��%�%�%j E�OeW 	X 	 
f� �?5�>�=���<�? 0 dupe_to_new_playlist  �> �;��; �  �:�: 0 pid  �=  � �9�8�7�6�9 0 pid  �8 0 osacom osaCom�7 0 m  �6 0 n  � �5MO�4Q�3\�2�1�0�/��.
�5 
days�4 0 playpid playPid
�3 
strq�2 0 remaddr remAddr
�1 
spac
�0 .sysoexecTEXT���     TEXT�/ 0 m  � �-�,�+
�- 
errn�, 0 n  �+  
�. .ascrcmnt****      � ****�< 5 #k� n�%�%�%�%�,E�O��%�%�%j 	oW X 
 �j O�j � �*o�)�(���'�* 0 get_login_info  �)  �(  � �&�%�& 0 m  �% 0 n  � �$�#�"�!� ��������������������$ 0 sharedlibname sharedLibName�# 0 read_defaults  
�" 
cobj�! 0 remusername remUserName�  0 remhostipaddr remHostIPAddr� 0 m  � ���
� 
errn� 0 n  �  ��@
� 
dtxt
� .sysodlogaskr        TEXT
� 
ttxt� 0 write_defaults  
� .ascrcmnt****      � ****
� 
errn���
� 
ctxt� 0 remaddr remAddr�' � )�k+ E[�k/E�Z[�l/E�ZW UX  k�lv� 1��%�%��l �,E�O��%�%�a l �,E�O)���lvl+ Y �j O�j O)a a lhO�a %�%a &E` OP� �������� 0 write_defaults  � ��� �  ��� 0 k  � 0 l  �  � �
�	�
 0 k  �	 0 l  � 	����
� 
spac
� 
strq� 0 list_to_text  
� .sysoexecTEXT���     TEXT�  �b   %�%��,%�%�)��l+ %�%%j � � ������ 0 read_defaults  � � ��  �  ���� 0 k  �  � ���� 0 k  � 4����8����
�� 
spac
�� 
strq
�� .sysoexecTEXT���     TEXT
�� 
cpar� �b   %�%��,%�%�%j �-E� ��?���������� 0 escape_single_quotes  �� ����� �  ���� 0 x  ��  � ���� 0 x  � LO������ 0 replace_chars  
�� 
ctxt�� )���m+ �&� ��V���������� 0 replace_chars  �� ����� �  �������� 0 txt  �� 0 srch  �� 0 repl  ��  � ���������� 0 txt  �� 0 srch  �� 0 repl  �� 0 	item_list  � ��������~
�� 
ascr
�� 
txdl
�� 
citm
�� 
TEXT�� !���,FO��-E�O���,FO��&E�O���,FO�� ������������� 0 list_to_text  �� ����� �  ������ 0 thelist theList�� 	0 delim  ��  � �������������� 0 thelist theList�� 	0 delim  �� 0 saved saveD�� 0 txt  �� 0 errstr errStr�� 0 errnum errNum� �����������
�� 
ascr
�� 
txdl
�� 
ctxt�� 0 errstr errStr� ������
�� 
errn�� 0 errnum errNum��  
�� 
errn�� 4��,E�O �kv��,FO��&E�W X  ���,FO)�l�O���,FO�� �����������
�� .aevtoappnull  �   � ****� k    .��  ����  ��  ��  � ���� 0 t  � 3 ����� /�� 5���������������������� \ b�� y���� ������� ��� � ����� ��� ��������� � �������������������
�� 
sele�� 0 sel  
�� 
btns
�� 
dflt
�� 
disp�� 
�� .sysodlogaskr        TEXT
�� 
cobj�� 0 t1  
�� 
pcls
�� 
cShT
�� 
ctnr
�� 
pnam�� 0 sharedlibname sharedLibName�� 0 get_login_info  �� 0 playlistname playlistName
�� 
pArt
�� 
pAlb
�� 
ctxt�� 0 defans defAns
�� 
dtxt�� 0 ddresult ddResult
�� 
ttxt
�� 
bhit
�� 
bool�� 0 escape_single_quotes  �� 0 make_rem_playlist  
�� 
ret 
�� 
givu�� �� 
�� 
kocl
�� .corecnte****       ****
�� 
pPIS�� 0 dupe_to_new_playlist  ��  ��  ��/�+*�,E�O�jv  ���kv�k�j� 	OhY 4��k/E�O��,�  ��,�,�,EE` Y a �a kv�k�j� 	OhO)j+ Oa E` O�a ,a %�a ,%a &E` Oa a _ �a a lv�l� 	E` O_ a  ,a !	 _ a ",a # a $& )_ a  ,k+ %E` Y hO)j+ &f  %_ 'a (%�a )kv�k�ja *a +a , 	OhY hO -�[a -�l .kh   )�a /,Ek+ 0W X 1 2h[OY��Uascr  ��ޭ