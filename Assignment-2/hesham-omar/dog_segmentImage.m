function [BW,maskedImage] = dog_segmentImage(RGB)

X = rgb2lab(RGB);

% Graph cut
foregroundInd = [52615 52616 52618 52619 52620 52621 52622 53262 53270 53919 53920 53921 53923 54572 55222 55223 55871 55872 56519 57788 57814 61699 62993 65544 67525 70114 71361 72008 72055 72702 75290 76584 77231 78465 78525 79111 79819 81113 82026 82028 82030 82032 82033 82035 82672 82673 82684 82685 83318 83333 83335 83336 83700 83984 84611 84632 85256 85280 85281 85640 85901 86287 86546 86576 87189 87191 87192 88227 88474 88475 88476 88477 88480 88481 88519 89763 89765 89766 89814 90102 90408 90410 90814 91460 91700 91701 91756 92347 92403 92993 93399 93639 93698 94285 94692 94993 95579 95985 96226 96287 96873 97519 97520 97926 98166 98229 98812 99158 99865 100105 100171 101398 101466 101746 101805 102045 103040 103338 103407 103687 103985 104391 104631 104701 104981 105277 105348 105684 105924 106570 106643 106922 106977 107213 107859 107937 108216 108503 108504 108505 108584 108918 109148 109150 109770 109771 109773 109778 109779 109780 109781 109782 109794 109878 110157 110411 110412 110413 110414 110415 110416 110859 111051 111052 111055 111057 111173 111506 111686 111689 111690 111694 111695 111696 111698 111820 112098 112330 112332 112467 112972 112974 113614 113616 113617 113761 114039 114094 114903 114904 115055 115333 115388 115548 116035 116193 116194 116350 117485 117921 117976 118130 118291 119215 119423 119585 119917 120509 120716 121858 122175 122656 123097 123152 123303 123799 124116 125038 125093 125411 125740 126058 126332 126533 127035 127178 127353 127626 127824 128329 128648 128920 129113 129115 129295 129624 129760 129943 129944 130271 130405 130592 130861 131239 131241 131508 131566 131698 131889 131890 132213 132345 132802 132860 132990 133187 133508 133635 133836 133838 133839 133840 133841 134491 134493 134494 134495 134496 134743 134803 134928 135147 135149 135152 135390 135451 135573 135801 135803 135805 135807 135810 136099 136219 136461 136464 136466 136469 136471 136473 136684 137124 137393 137512 137776 137778 137978 138041 138042 138158 138432 138689 138803 138804 139085 139087 139092 139096 139097 139273 139337 139449 139744 140091 140092 140093 140094 140567 140736 140738 141038 141215 141345 141346 141348 141349 141350 141351 141352 141353 141354 141355 141356 141357 141358 141359 141360 141362 141363 141364 141365 141367 141368 141369 141370 141373 141374 141375 141377 141378 141380 141381 141382 141685 141934 141971 141972 141974 141975 141977 141978 141980 141981 141984 141987 141988 141989 141991 142509 142582 142583 142584 142613 142614 142615 142616 142617 142618 143156 143232 143233 143235 143237 143239 143241 143244 143246 143248 143249 143251 143252 143255 143256 143257 143258 143259 143625 143804 144272 144919 145746 146213 147040 147507 148154 148335 148801 150095 150277 151389 152218 152683 152865 153977 154159 155271 155453 156100 156565 156748 157212 158042 158043 159337 159800 160447 161279 161741 161926 163035 163220 163682 164514 164976 166270 166455 166917 167102 167749 168211 168396 169043 169505 169690 170337 170799 170984 171631 172093 172278 172740 174682 177271 177918 180042 180506 181983 183094 183277 183924 184388 186330 186512 187159 187806 188453 189101 189195 189197 189199 189200 189201 189203 189204 189205 189206 189208 189566 189834 189836 189839 189840 189857 189858 190481 190506 190507 191043 191125 191155 191508 191803 191804 192414 192452 192984 193059 193631 193748 193749 193750 194097 194397 194925 194998 195045 195046 195694 196039 196220 196289 196342 196343 196935 197333 197514 197581 197641 197642 198161 198226 198290 198627 199455 199519 199586 199587 200103 200235 200236 200237 200568 200750 200886 201215 201457 202045 202103 202183 202692 202749 202831 203339 203482 203803 203986 204041 204130 204778 204779 204780 205281 205330 205332 205428 205429 205928 205976 206078 206391 206620 206726 207222 207266 207375 207376 207685 207911 208024 208025 208027 208516 208557 209811 209971 210494 210495 210620 210623 211105 211141 211273 211567 211752 211786 211787 211920 211921 211922 211923 212399 212433 212571 212572 212573 212575 212576 213046 213080 213224 213225 213226 213693 213727 213874 213875 213876 214340 214373 214524 214526 214527 215020 215175 215176 215449 215667 215824 216281 216472 216961 217120 217121 217122 217389 217575 217770 218222 218254 218420 218421 218901 219069 219070 219516 219718 219719 220195 221015 221456 221457 221488 222311 222565 222782 222958 222959 223397 223606 223607 223859 224075 224689 224903 225336 225369 225553 225800 227275 227310 228569 229215 229442 230508 230544 230737 232448 233132 233329 233741 234426 235274 235275 235681 236573 236974 237013 237869 238517 238518 238913 238954 239167 239601 239816 240207 240466 241114 241115 241499 241764 242145 242412 242413 242834 243062 243481 243709 243710 244359 244360 244732 244775 245008 245009 245657 245658 246026 246307 246714 246955 247319 247603 248253 248612 248900 249548 249906 249947 250196 251199 251491 251846 252139 252533 252786 253786 253826 254432 255079 255765 256206 256670 257019 257058 257665 257965 258312 258613 258792 258957 258958 259260 259604 259645 260250 260291 260555 260896 260936 261202 261542 261849 261885 261889 261891 261892 261894 261895 261896 261898 261899 261903 261906 261907 261908 261910 261911 261912 261914 261915 262027 262188 262496 262527 262529 262530 262563 262568 263143 263173 263481 263522 263790 263864 263867 263869 263870 264167 264519 264520 264521 264774 264775 265171 265173 265175 265176 265177 265179 265180 265262 265731 265828 265832 266068 266106 266378 266486 266487 266489 267043 267137 267138 267143 267203 267361 267399 267672 267791 268008 268045 268319 268333 268441 268443 268446 268448 268449 268450 268452 268655 268656 268691 268977 269303 269337 269613 269750 269751 269752 269753 269755 269953 269954 269983 270260 270408 270411 270437 270629 270907 271062 271063 271065 271067 271249 271250 271251 271274 271554 271718 271722 271723 271724 271731 271900 271901 271920 272200 272204 272371 272372 272374 272375 272376 272377 272549 272550 272551 272566 272847 272848 273199 273200 273201 273202 273203 273204 273205 273206 273208 273209 273210 273211 273212 ];
backgroundInd = [10414 10416 10419 10421 10422 10424 10436 11053 11054 11055 11092 11742 13057 13248 13249 13256 13259 13724 14276 14277 14350 14372 14400 14402 14405 14407 14410 14565 14828 14830 14923 14970 15071 15073 15213 15246 15248 15946 15948 15996 16019 16022 16024 16042 16311 17605 17682 17996 18252 18332 18645 18741 19545 20090 20595 20930 21245 22235 22892 22895 23076 23567 23728 24217 24221 24222 24223 24375 24495 24671 24674 24953 24987 24991 24995 25146 25331 26229 26309 26512 26812 26911 26914 27759 27934 28405 28811 29247 29840 29882 30769 30814 31179 31180 31290 31291 31293 31295 31296 31297 31298 31299 31301 31303 31304 31306 31782 31923 31924 31925 31927 31928 31930 31931 31932 31933 31934 31935 31956 31957 32337 32560 32561 32562 32563 32564 32565 32568 32606 32984 33205 33253 33254 33608 33609 33631 33902 33903 34050 34551 34696 34964 35062 35139 35140 35553 35783 35784 35846 36429 36493 36866 37074 37142 37718 37720 38199 38437 38759 38792 38916 39008 39010 39085 39655 39775 39883 40210 40301 40448 40604 40610 40621 40622 40701 40787 40945 40946 41028 41095 41239 41591 42236 42575 42576 42797 42798 42825 42882 42883 42971 43034 43172 43227 43477 43529 43937 43967 44175 44614 44821 44914 44975 45261 45358 45468 45562 45622 45879 46030 46114 46209 46970 47120 47407 47503 47649 47697 47769 47974 48053 48150 48469 48512 48797 49345 49346 49636 49991 49992 50092 50147 50453 50637 50884 51234 51283 51284 51386 51881 51926 51927 51928 51929 52033 52089 52135 52498 52570 52571 53216 53327 53605 53727 53861 53862 54072 54253 54254 54318 54506 54507 55069 55152 55612 55668 55798 55915 56442 56443 56615 57032 57088 57396 57495 57533 57733 57734 58000 58378 58379 58689 59185 59671 59883 59982 60772 60784 60805 60964 61385 61611 62033 62069 62257 62385 62440 62904 63393 63551 63703 63756 63815 64173 64198 64326 64382 64626 64845 64973 65023 65030 65275 65492 65620 65922 66043 66119 66139 66267 66324 66332 66785 66786 66914 67096 67432 67561 68208 68707 68726 68855 69373 69502 69808 70020 70667 70796 71314 71443 71961 72090 72451 72737 72855 72915 73784 74031 74678 75325 75636 75741 75841 76283 76488 77067 77301 77316 77948 78406 79519 79706 79942 79945 80370 81000 81017 81461 81795 82243 82442 82474 82512 82515 82610 82755 83122 83768 83800 83862 83873 83880 83881 83882 83887 83892 83897 84252 84416 84434 84439 84444 84508 84899 85063 85710 86077 86438 86794 87084 89267 90206 90308 91819 92467 92557 94581 94823 95183 96356 97004 97086 98962 99264 99608 99719 99763 99986 99987 99988 100248 100249 100250 100427 100558 101074 101852 101923 104507 105087 105557 105586 105734 105798 105799 106250 106381 106897 107677 108083 108733 109027 110733 110755 111606 112249 112696 112720 112862 112889 113367 113510 113990 114807 114812 114816 114820 115192 115198 117133 123702 125549 126954 127574 127601 128187 128248 128895 130725 132731 133350 134718 135337 135365 135984 136583 136613 139170 139848 139877 140464 140513 141730 143129 143759 144423 146895 149482 150242 150889 152182 152716 152829 155304 155416 155964 156063 156611 157978 158004 158552 158651 159186 159298 160581 160592 161126 161239 161806 162434 162522 162533 163715 163827 164474 165121 165653 165768 166404 166416 167710 168358 169005 169652 170299 171594 172845 172889 173433 174183 174743 174830 176010 176124 176728 176771 177419 178066 178675 178714 180008 181302 181949 182577 183243 184538 186480 187647 189717 190881 191012 194248 195542 197410 200071 200622 200718 201961 204549 207184 207831 208367 210379 210955 211621 211709 212355 213614 214926 216779 219343 220662 221996 222189 222192 222194 222196 222197 222198 222846 222847 222849 223340 223481 223497 223498 223500 223987 224127 224148 224150 224151 224545 224771 224772 224799 224800 224801 224802 225451 225926 226063 226099 226100 226747 226748 226749 226750 226751 227194 227219 227355 227399 227402 227752 228051 228052 228646 229111 229737 229757 229939 230000 230001 230585 231031 231051 231304 231744 231878 231952 233170 233171 233250 233816 233900 234549 235109 235201 235756 235784 235787 235788 235789 235845 235847 235848 235849 235850 236402 236430 236437 236438 236439 236440 236441 236442 236498 237091 237092 237145 237694 237695 237740 237792 238192 238440 238986 239016 239037 239088 239486 239736 240309 240383 240779 240926 240995 241032 241573 241602 241680 242219 242286 242865 242975 243367 243511 243542 243622 243926 244158 244269 244597 244860 244861 244891 244917 245451 245510 245517 245539 245565 246097 246129 246213 246601 246776 246861 247184 247391 247444 247445 247446 247447 247449 247460 248090 248098 248099 248157 248684 249331 249384 249396 249749 249977 250624 250698 250753 251271 251301 251325 251344 251346 251402 251735 251918 251948 252052 252565 252640 253211 253676 253742 253887 254000 254504 254534 254582 254648 255151 255201 255205 255208 255213 255223 255224 255226 255227 255228 255229 255296 255297 255298 255845 255865 255866 255869 255877 255945 255947 256264 256445 256474 256490 256513 256514 256516 256518 256595 256596 256597 257092 257246 257247 257248 257767 257768 257782 257795 257897 257898 257899 258257 258386 258468 258548 258549 259032 259060 259096 259114 259198 259199 259679 259741 259773 260122 260212 260326 260353 260367 260422 260432 260496 260786 260826 261000 261012 261057 261620 261704 261725 261729 262293 262374 262939 262999 263022 263597 263647 264208 264265 264294 264318 264705 264855 264942 264967 264999 265351 265502 265526 265998 266148 266238 266263 266303 266668 266682 266795 266829 266912 266951 266983 267237 267442 267495 267534 267560 267605 267938 267939 268089 268141 268181 268209 268278 268512 268531 268735 268736 268794 268830 269382 269478 269551 269806 270029 270051 270126 270153 270201 270499 270676 270698 270773 270803 270849 270868 271197 271322 271515 271797 271969 272067 272145 272615 272616 272638 272670 272714 272746 273262 273361 273440 273768 273908 273931 273964 273970 274008 274044 274405 274611 274654 274692 274734 275201 275224 275259 275698 275723 275906 276372 276494 276518 276554 276558 276636 277141 277201 277284 277810 277849 277854 278217 278234 278434 278526 278580 279080 279104 279145 279146 279151 279153 279158 279164 279263 279620 279877 279929 280374 280396 280406 280526 280576 281043 281053 281171 281174 281359 281362 281369 281370 281666 281690 281739 282465 282473 282672 282673 282960 282983 283036 283322 283324 283393 283971 283973 284253 284276 284334 284335 284899 284984 285066 285086 285269 285271 285546 285570 285632 285919 286364 286477 286478 286479 286480 286567 286569 286675 286732 286863 287217 287275 287486 287487 287510 287701 287760 287761 287779 287780 287866 287867 287969 287976 288157 288228 288231 288309 288398 288429 288515 288569 288779 288804 288882 288996 289044 289077 289266 289451 289530 289582 289729 289811 289812 290098 290229 290262 290334 290335 290377 290378 290379 290461 290720 290745 290829 290980 291027 291030 291055 291110 291174 291210 291367 291627 291677 291679 291804 292039 292040 292127 292129 292200 292327 292353 292407 292813 292849 292919 292975 292976 293171 293219 293308 293458 293565 293652 293703 293745 293824 293832 293986 294075 294143 294272 294303 294392 294602 294789 294792 294858 294919 294952 295000 295249 295286 295436 295504 295568 295649 295686 295896 295935 296024 296081 296215 296251 296333 296728 296796 296864 296901 296902 296945 297189 297235 297237 297371 297386 297413 297414 297439 297440 297441 297442 297512 297551 297572 297595 297596 297627 297887 297890 297973 298014 298034 298084 298085 298160 298201 298202 298205 298208 298209 298210 298211 298212 298215 298216 298218 298219 298275 298482 298538 298541 298543 298545 298548 298551 298554 298558 298564 298566 298571 298575 298578 298582 298585 298588 298592 298597 298599 298604 298607 298608 298612 298624 298649 298651 298656 298713 298714 298716 298717 298718 298720 298721 298722 298724 298726 298727 298728 298808 298893 298922 299279 299284 299286 299290 299332 299456 299457 299510 299542 299543 299595 299776 299911 299916 299918 299919 299921 299922 299923 299924 299925 299926 300104 300105 300155 300217 300233 300423 300485 300489 300491 300496 300501 300503 300507 300511 300519 300524 300526 300530 300532 300570 300572 300573 300628 300753 300754 300755 300800 300839 300885 301070 301098 301102 301103 301107 301110 301111 301115 301118 301120 301122 301125 301126 301128 301129 301130 301179 301181 301182 301183 301187 301188 301213 301215 301216 301404 301406 301443 301445 301490 301512 301513 301527 301717 301722 301723 301725 301727 301728 301729 301732 301733 301737 301741 301743 301839 301842 301844 301846 301848 301850 301852 301853 301855 301856 301857 301858 301859 301923 302056 302060 302065 302066 302067 302069 302070 302072 302073 302074 302075 302076 302077 302080 302082 302083 302084 302085 302086 302087 302088 302089 302139 302362 302364 302367 302572 302708 302721 302724 302726 302786 302808 302846 302868 302872 302874 302875 302877 302879 302880 302881 302882 302883 302884 302885 302886 302887 302888 302889 302890 302891 302892 302901 302903 302906 302907 302910 302912 302914 302916 302918 302919 302925 302926 302927 302928 302929 302930 302931 302932 303004 303006 303007 303011 303219 303357 303359 303364 303368 303376 303379 303380 303381 303384 303386 303393 303395 303433 303493 303513 303581 303583 303647 303648 303649 303658 303659 304030 304031 304080 304140 304232 304233 304234 304235 304236 304237 304238 304287 304289 304290 304291 304292 304293 304309 304681 304684 304685 304691 304695 304727 304787 304804 304886 304887 304888 304928 304929 304931 304933 304958 305155 305334 305336 305338 305341 305342 305373 305434 305447 305448 305536 305537 305539 305540 305574 305610 305800 305985 305986 305987 305988 306081 306091 306093 306190 306191 306193 306220 306221 306445 306666 306728 306729 306730 306733 306734 306736 306737 306844 306845 306846 306847 306848 306849 306852 306864 306865 306866 307090 307313 307341 307557 307734 307735 308207 308606 308636 308859 309024 309252 309669 309670 310156 310158 310313 310314 310812 310818 310958 310960 311467 311472 311478 311480 311600 312131 312137 312140 312145 312151 312154 312159 312163 312167 312172 312180 312183 312188 312193 312194 312198 312203 312204 312208 312212 312215 312218 312222 312224 312227 312231 312232 312241 312242 312245 313539 313541 313548 313555 313563 313566 313579 313581 313594 313598 313766 313767 313997 314003 314013 314021 314027 314030 314045 314049 314057 314074 314080 314102 314109 314144 314148 314163 314165 314173 314174 314177 314180 314182 314184 314185 314186 314187 314188 314189 314278 314282 314409 314410 314588 314589 314599 314602 314607 314613 314620 314622 314628 314631 314636 315109 315686 315837 315845 315849 315856 315865 315869 315876 316270 316275 316292 316296 316306 316310 316327 316330 316468 316475 316478 317110 317746 317753 319034 319640 319674 320317 320957 320959 320960 320963 321582 321583 321584 321587 321592 321593 321598 ];
L = superpixels(X,1766,'IsInputLab',true);

scaledX = prepLab(X);
BW = lazysnapping(scaledX,L,foregroundInd,backgroundInd);
maskedImage = RGB;
maskedImage(repmat(~BW,[1 1 3])) = 0;
end

function out = prepLab(in)
out = in;
out(:,:,1) = in(:,:,1) / 100;  % L range is [0 100].
out(:,:,2) = (in(:,:,2) + 86.1827) / 184.4170;  % a* range is [-86.1827,98.2343].
out(:,:,3) = (in(:,:,3) + 107.8602) / 202.3382;  % b* range is [-107.8602,94.4780].

end