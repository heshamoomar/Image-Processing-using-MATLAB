function [BW,maskedImage] = cat1_segmentImage(RGB)
%segmentImage Segment image using auto-generated code from Image Segmenter app
%  [BW,MASKEDIMAGE] = segmentImage(RGB) segments image RGB using
%  auto-generated code from the Image Segmenter app. The final segmentation
%  is returned in BW, and a masked image is returned in MASKEDIMAGE.

% Auto-generated by imageSegmenter app on 04-May-2023
%----------------------------------------------------


% Convert RGB image into L*a*b* color space.
X = rgb2lab(RGB);

% Graph cut
foregroundInd = [2764 2933 3440 3609 3947 4792 5130 5637 5806 5975 5976 6145 6314 6483 6652 6822 6991 7160 7329 7499 7668 7837 7838 8007 8176 8345 8346 8515 8684 8853 8854 9023 9193 9362 9531 9532 9701 9870 10040 10209 10378 10547 10548 10717 10886 11055 11056 11225 11394 11563 11733 11902 12071 12240 12409 12410 12579 12748 12918 13087 13256 13595 13765 13935 14104 14112 14113 14114 14115 14116 14117 14118 14274 14279 14280 14288 14289 14290 14291 14292 14443 14444 14447 14448 14454 14461 14462 14463 14464 14613 14614 14615 14616 14623 14633 14634 14635 14636 14637 14638 14639 14782 14783 14784 14785 14808 14809 14810 14811 14949 14950 14951 14953 14980 14981 14982 15117 15151 15152 15153 15154 15284 15285 15323 15324 15325 15453 15457 15492 15493 15494 15620 15621 15626 15637 15638 15639 15640 15641 15642 15643 15660 15661 15789 15794 15804 15805 15815 15828 15963 15988 15997 16157 16166 16294 16308 16326 16335 16462 16495 16504 16664 16673 16777 16779 16799 16812 16817 16820 16822 16823 16833 16834 16843 16844 16845 16846 16847 16848 16945 16968 16978 16988 16994 17003 17018 17019 17117 17118 17119 17147 17164 17172 17188 17189 17190 17292 17293 17303 17304 17315 17325 17342 17359 17360 17361 17459 17460 17464 17471 17477 17505 17512 17513 17531 17532 17629 17636 17637 17639 17646 17651 17656 17662 17702 17703 17704 17799 17800 17819 17827 17835 17854 17855 17873 17874 17875 17969 18004 18026 18044 18045 18046 18138 18139 18151 18152 18162 18195 18197 18308 18320 18331 18341 18347 18367 18368 18369 18386 18477 18478 18489 18491 18505 18523 18538 18539 18540 18556 18557 18647 18657 18659 18663 18675 18681 18684 18690 18691 18692 18694 18695 18696 18697 18698 18699 18701 18703 18704 18705 18706 18710 18711 18726 18816 18826 18848 18876 18877 18878 18879 18880 18881 18882 18883 18884 18885 18886 18887 18896 18985 18994 19010 19021 19065 19154 19164 19188 19199 19234 19323 19324 19349 19368 19379 19380 19381 19382 19383 19393 19394 19395 19396 19397 19398 19399 19403 19493 19500 19516 19518 19546 19547 19548 19552 19553 19561 19562 19568 19569 19572 19662 19669 19682 19694 19695 19715 19722 19723 19729 19730 19738 19739 19740 19741 19831 19844 19857 19864 19874 19880 19881 19892 19893 19894 19895 19896 19897 19910 20000 20006 20007 20033 20049 20175 20210 20218 20338 20372 20373 20387 20507 20512 20524 20541 20555 20556 20676 20699 20708 20724 20845 20850 20861 20863 20868 20875 20883 20892 20893 21013 21014 21025 21030 21044 21060 21061 21182 21194 21201 21205 21212 21219 21229 21351 21374 21397 21520 21542 21549 21551 21566 21689 21709 21711 21715 21724 21734 21858 21877 21883 21902 21903 22027 22037 22070 22071 22196 22200 22225 22237 22238 22364 22365 22369 22375 22376 22406 22533 22574 22575 22702 22713 22729 22730 22734 22871 22882 22901 22911 23040 23045 23080 23209 23214 23235 23236 23239 23249 23378 23386 23392 23418 23547 23566 23587 23715 23716 23721 23722 23732 23733 23735 23756 23884 23889 23890 23925 24053 24094 24221 24245 24252 24253 24254 24255 24256 24257 24258 24263 24389 24410 24411 24421 24427 24428 24432 24433 24557 24558 24571 24572 24574 24577 24589 24590 24597 24602 24603 24604 24725 24740 24755 24756 24757 24759 24766 24767 24774 24776 24777 24785 24786 24787 24788 24789 24790 24791 24792 24793 24893 24894 24921 24922 24923 24924 24928 24936 24937 24946 24947 24948 24949 24950 24951 24952 24953 24954 24962 25061 25062 25077 25078 25079 25080 25081 25082 25083 25084 25085 25086 25087 25088 25089 25090 25106 25107 25108 25130 25131 25227 25228 25229 25241 25242 25243 25244 25245 25277 25278 25279 25280 25281 25282 25298 25299 25394 25395 25396 25397 25398 25399 25400 25401 25402 25403 25404 25405 25406 25407 25408 25409 25410 25452 25453 25454 25458 25459 25461 25464 25465 25466 ];
backgroundInd = [29 30 31 32 33 34 36 37 194 196 197 206 207 208 209 210 358 359 360 363 386 390 391 392 393 524 525 526 527 558 569 690 691 692 726 727 741 858 895 912 913 1026 1064 1195 1233 1363 1401 1402 1423 1570 1592 1701 1739 1761 1870 1908 1930 2077 2207 2246 2376 2415 2437 2584 2605 2714 2753 2774 2922 2943 3091 3260 3281 3430 3599 3768 3937 3957 4106 4126 4275 4444 4613 4782 4803 4951 5080 5120 5289 5458 5587 5627 5648 5796 5818 5965 6134 6303 6472 6601 6641 6979 7003 7148 7173 7318 7342 7487 7512 7681 7825 7851 7953 8020 8021 8164 8190 8333 8360 8629 8671 8698 8840 8868 9037 9178 9207 9376 9517 9545 9686 9715 9855 9884 10024 10054 10193 10223 10319 10363 10392 10532 10562 10731 10870 10900 11070 11208 11239 11333 11377 11408 11409 11547 11578 11716 11748 11749 11750 11751 11885 11920 11921 11922 12055 12092 12093 12094 12224 12263 12264 12265 12393 12436 12563 12606 12608 12609 12732 12778 12779 12780 12781 12782 12901 12951 12952 12953 13071 13192 13240 13294 13295 13410 13464 13465 13466 13579 13635 13636 13749 13806 13807 13918 13976 13977 14088 14146 14147 14257 14316 14317 14487 14488 14489 14659 14660 14765 14766 14830 14831 14935 15000 15001 15104 15105 15170 15171 15270 15271 15274 15340 15440 15441 15442 15443 15444 15509 15510 15558 15585 15586 15587 15588 15589 15590 15593 15594 15595 15596 15597 15598 15599 15600 15602 15607 15609 15612 15613 15614 15679 15754 15923 16017 16092 16186 16261 16356 16357 16358 16359 16403 16430 16599 16600 16702 16769 16872 16873 17042 17043 17107 17212 17213 17214 17215 17216 17217 17276 17386 17387 17445 17556 17615 17725 17784 17785 17894 17954 17955 18124 18125 18232 18294 18295 18464 18465 18570 18634 18769 18803 18908 18972 18973 19077 19142 19311 19480 19584 19649 19753 19818 19922 19988 20157 20326 20664 20767 20797 20833 20936 21002 21105 21171 21340 21412 21413 21414 21415 21416 21417 21418 21419 21420 21421 21422 21429 21430 21431 21432 21433 21434 21435 21436 21437 21438 21439 21473 21509 21579 21580 21581 21594 21595 21596 21597 21608 21609 21610 21611 21678 21748 21847 21917 22016 22086 22185 22255 22353 22354 22425 22426 22427 22428 22429 22522 22598 22599 22600 22690 22691 22770 22771 22859 22940 22994 23027 23028 23109 23196 23279 23364 23365 23532 23533 23618 23700 23701 23789 23868 23869 23958 24008 24037 24128 24204 24298 24373 24467 24515 24541 24542 24636 24709 24710 24805 24878 24974 25046 25191 25215 25312 25383 25481 25552 25650 25720 25819 25867 25889 25988 26058 26157 26205 26227 26325 26326 26374 26396 26494 26565 26566 26662 26663 26712 26735 26829 26830 26831 26881 26905 26906 26991 26992 26993 26994 26995 26996 26997 27050 27075 27076 27077 27154 27155 27156 27157 27158 27159 27219 27246 27247 27248 27249 27250 27251 27300 27301 27302 27303 27304 27305 27306 27307 27308 27309 27310 27311 27312 27313 27314 27315 27316 27318 27320 27321 27322 27388 27421 27422 27423 27424 27425 27426 27427 27458 27459 27460 27462 27463 27464 27465 27466 27467 27468 27557 27597 27598 27599 27600 27601 27602 27603 27604 27605 27606 27607 27608 27609 27611 27612 27613 27614 27615 27616 27617 27618 27619 27620 27621 27622 27623 27624 27625 27626 27627 27726 27895 28064 28233 28402 28570 28739 28908 29077 29415 29583 29752 29921 30090 30259 30428 30597 30765 30934 31272 31948 32116 32623 32792 33299 33468 33469 33470 33471 33472 33473 ];
L = superpixels(X,271,'IsInputLab',true);

% Convert L*a*b* range to [0 1]
scaledX = prepLab(X);
BW = lazysnapping(scaledX,L,foregroundInd,backgroundInd);

% Create masked image.
maskedImage = RGB;
maskedImage(repmat(~BW,[1 1 3])) = 0;
end

function out = prepLab(in)

% Convert L*a*b* image to range [0,1]
out = in;
out(:,:,1) = in(:,:,1) / 100;  % L range is [0 100].
out(:,:,2) = (in(:,:,2) + 86.1827) / 184.4170;  % a* range is [-86.1827,98.2343].
out(:,:,3) = (in(:,:,3) + 107.8602) / 202.3382;  % b* range is [-107.8602,94.4780].

end
