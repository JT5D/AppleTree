FasdUAS 1.101.10   ��   ��    k             l     ��  ��     rm -rf ~/.Trash/*     � 	 	 " r m   - r f   ~ / . T r a s h / *   
  
 l     ��������  ��  ��        l     ��  ��    ! tell application "Terminal"     �   6 t e l l   a p p l i c a t i o n   " T e r m i n a l "      l     ��  ��    7 1 set currentTab to do script ("ssh user@server;")     �   b   s e t   c u r r e n t T a b   t o   d o   s c r i p t   ( " s s h   u s e r @ s e r v e r ; " )      l     ��  ��     delay 6     �    d e l a y   6      l     ��  ��    5 /do script ("do something remote") in currentTab     �   ^ d o   s c r i p t   ( " d o   s o m e t h i n g   r e m o t e " )   i n   c u r r e n t T a b     !   l     �� " #��   "  end tell    # � $ $  e n d   t e l l !  % & % l     ��������  ��  ��   &  ' ( ' l     �� ) *��   ) % CREATE NEW TEXT FILE ON DESKTOP    * � + + > C R E A T E   N E W   T E X T   F I L E   O N   D E S K T O P (  , - , l     �� . /��   .   set theDir to "~/Desktop/"    / � 0 0 4 s e t   t h e D i r   t o   " ~ / D e s k t o p / " -  1 2 1 l     �� 3 4��   3 8 2do shell script "touch " & theDir & "SomeFile.txt"    4 � 5 5 d d o   s h e l l   s c r i p t   " t o u c h   "   &   t h e D i r   &   " S o m e F i l e . t x t " 2  6 7 6 l     �� 8 9��   8 ) #do shell script "rm -rf ~/.Trash/*"    9 � : : F d o   s h e l l   s c r i p t   " r m   - r f   ~ / . T r a s h / * " 7  ; < ; l     ��������  ��  ��   <  = > = l     ?���� ? I    �� @��
�� .sysoexecTEXT���     TEXT @ m      A A � B Bd c u r l   - - s i l e n t   " h t t p : / / x m l . w e a t h e r . y a h o o . c o m / f o r e c a s t r s s ? p = T H X X 0 0 2 4 & u = c "   |   g r e p   - E   ' ( C u r r e n t   C o n d i t i o n s : | C < B R ) '   |   s e d   - e   ' s / C u r r e n t   C o n d i t i o n s : / / '   - e   ' s / < b r   \ / > / / '   - e   ' s / < b > / / '   - e   ' s / < \ / b > / / '   - e   ' s / < B R   \ / > / / '   - e   ' s / < d e s c r i p t i o n > / / '   - e   ' s / < \ / d e s c r i p t i o n > / / '   - e   ' s / , / / '   |   t a i l   - n 1   |   t r   ' [ : l o w e r : ] '   ' [ : u p p e r : ] '��  ��  ��   >  C D C l     ��������  ��  ��   D  E F E l     ��������  ��  ��   F  G�� G l     �� H I��   H _ Ydo shell script "/path/to/command" with administrative privileges password "passwordhere"    I � J J � d o   s h e l l   s c r i p t   " / p a t h / t o / c o m m a n d "   w i t h   a d m i n i s t r a t i v e   p r i v i l e g e s   p a s s w o r d   " p a s s w o r d h e r e "��       �� K L��   K ��
�� .aevtoappnull  �   � **** L �� M���� N O��
�� .aevtoappnull  �   � **** M k      P P  =����  ��  ��   N   O  A��
�� .sysoexecTEXT���     TEXT�� �j  ascr  ��ޭ