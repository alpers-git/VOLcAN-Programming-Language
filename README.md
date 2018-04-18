# VOLcAN-Programming-Language
A parodic programming language for propositional calculus with fully typed lex and yacc.

**The example program is given below:**
_$tanumlarimizu ha buraya yazayruz$_
**tanum_basladu** <br>
Mutlu_miyum(mutliluk)<br>
{<br>
**dondür** mutliluk | dogridur;<br>
}<br>
Tarlaya_gidecek_miyum(hava_güneslidur, fadime_evde_yokidur){<br>
gidecegum = hava_güneslidur & fadime_evde_yokidur;<br>
**eger**(gidecegum)<br>
{<br>
bastur gidecegum;<br>
}<br>
**degülse**<br>
{<br>
gidecegum = gidecegum | dogridur;<br>
}<br>
**dondür** gidecegum;<br>
}<br>
**tanum_bittu**<br>
_$Ha burada çalistirilacak kodu yazayruz (main)$_<br>
**tarattur** hava_güneslidur;<br>
**tarattur** fadime_evde_yokidur;<br>
gidecegum = Tarlaya_gidecek_miyum(hava_güneslidur, fadime_evde_yokidur);<br>
LAZ_DOGDUM_LAZ_KALACAGUM = dogridur;<br>
mutlu_bir_lazum = dogridur;<br>
**bastur** LAZ_DOGDUM_LAZ_KALACAGUM <-> gidecegum -> mutlu_bir_lazum;<br>
haftanun_günleru = dizü[7];<br>
fadime_benu_oldurecek = dogridur;<br>
**turla**(mutlu_bir_lazum)<br>
{<br>
haftanun_günleru[6] = dogridur;<br>
**turla**(fadime_benu_oldurecek)<br>
{<br>
yarduma_ihtiyacum_var = fadime_benu_oldurecek;<br>
**bastur** yarduma_ihtiyacum_var;<br>
mutlu_bir_lazum = ~mutlu_bir_lazum;<br>
};<br>
};<br>
