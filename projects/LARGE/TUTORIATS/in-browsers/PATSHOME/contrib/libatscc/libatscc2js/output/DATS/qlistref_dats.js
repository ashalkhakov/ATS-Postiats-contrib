/*
**
** The JavaScript code is generated by atscc2js
** The starting compilation time is: 2016-12-25: 21h:46m
**
*/

// ATSassume(ATSCC2JS_056_qlistref__qlistref_type)

function
ats2jspre_qlistref_make_nil()
{
//
// knd = 0
  var tmpret0
  var tmp1
  var tmp2
  var tmp3
  var tmp4
  var tmplab, tmplab_js
//
  // __patsflab_qlistref_make_nil
  tmp2 = null;
  tmp1 = ats2jspre_ref(tmp2);
  tmp4 = null;
  tmp3 = ats2jspre_ref(tmp4);
  tmpret0 = [tmp1, tmp3];
  return tmpret0;
} // end-of-function


function
ats2jspre_qlistref_length(arg0)
{
//
// knd = 0
  var tmpret5
  var tmp6
  var tmp7
  var tmp8
  var tmp9
  var tmp10
  var tmp11
  var tmplab, tmplab_js
//
  // __patsflab_qlistref_length
  tmp6 = arg0[0];
  tmp7 = arg0[1];
  tmp9 = ats2jspre_ref_get_elt(tmp6);
  tmp8 = ats2jspre_list_length(tmp9);
  tmp11 = ats2jspre_ref_get_elt(tmp7);
  tmp10 = ats2jspre_list_length(tmp11);
  tmpret5 = ats2jspre_add_int1_int1(tmp8, tmp10);
  return tmpret5;
} // end-of-function


function
ats2jspre_qlistref_enqueue(arg0, arg1)
{
//
// knd = 0
  var tmp13
  var tmp14
  var tmp15
  var tmp16
  var tmplab, tmplab_js
//
  // __patsflab_qlistref_enqueue
  tmp13 = arg0[0];
  tmp14 = arg0[1];
  tmp16 = ats2jspre_ref_get_elt(tmp13);
  tmp15 = [arg1, tmp16];
  ats2jspre_ref_set_elt(tmp13, tmp15);
  return/*_void*/;
} // end-of-function


function
ats2jspre_qlistref_dequeue_opt(arg0)
{
//
// knd = 0
  var tmpret17
  var tmp18
  var tmp19
  var tmp20
  var tmp21
  var tmp22
  var tmp23
  var tmp25
  var tmp26
  var tmp27
  var tmplab, tmplab_js
//
  // __patsflab_qlistref_dequeue_opt
  tmp18 = arg0[0];
  tmp19 = arg0[1];
  tmp20 = ats2jspre_ref_get_elt(tmp19);
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab0
      if(ATSCKptriscons(tmp20)) { tmplab_js = 4; break; }
      case 2: // __atstmplab1
      tmp23 = ats2jspre_ref_get_elt(tmp18);
      tmp25 = null;
      ats2jspre_ref_set_elt(tmp18, tmp25);
      // ATScaseofseq_beg
      tmplab_js = 1;
      while(true) {
        tmplab = tmplab_js; tmplab_js = 0;
        switch(tmplab) {
          // ATSbranchseq_beg
          case 1: // __atstmplab4
          if(ATSCKptriscons(tmp23)) { tmplab_js = 4; break; }
          case 2: // __atstmplab5
          tmpret17 = null;
          break;
          // ATSbranchseq_end
          // ATSbranchseq_beg
          case 3: // __atstmplab6
          case 4: // __atstmplab7
          tmp26 = tmp23[0];
          tmp27 = tmp23[1];
          ats2jspre_ref_set_elt(tmp19, tmp27);
          tmpret17 = [tmp26];
          break;
          // ATSbranchseq_end
        } // end-of-switch
        if (tmplab_js === 0) break;
      } // endwhile
      // ATScaseofseq_end
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab2
      case 4: // __atstmplab3
      tmp21 = tmp20[0];
      tmp22 = tmp20[1];
      ats2jspre_ref_set_elt(tmp19, tmp22);
      tmpret17 = [tmp21];
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret17;
} // end-of-function


function
ats2jspre_qlistref_foldleft(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret30
  var tmp31
  var tmp32
  var tmp41
  var tmp42
  var tmp43
  var tmplab, tmplab_js
//
  // __patsflab_qlistref_foldleft
  tmp31 = arg0[0];
  tmp32 = arg0[1];
  tmp41 = ats2jspre_ref_get_elt(tmp31);
  tmp43 = ats2jspre_ref_get_elt(tmp32);
  tmp42 = _ats2jspre_qlistref_auxl_5(arg2, arg1, tmp43);
  tmpret30 = _ats2jspre_qlistref_auxr_6(arg2, tmp41, tmp42);
  return tmpret30;
} // end-of-function


function
_ats2jspre_qlistref_auxl_5(env0, arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret33
  var tmp34
  var tmp35
  var tmp36
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_qlistref_auxl_5
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab8
        if(ATSCKptriscons(arg1)) { tmplab_js = 4; break; }
        case 2: // __atstmplab9
        tmpret33 = arg0;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab10
        case 4: // __atstmplab11
        tmp34 = arg1[0];
        tmp35 = arg1[1];
        tmp36 = env0[0](env0, arg0, tmp34);
        // ATStailcalseq_beg
        apy0 = tmp36;
        apy1 = tmp35;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_qlistref_auxl_5
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret33;
  } // endwhile-fun
} // end-of-function


function
_ats2jspre_qlistref_auxr_6(env0, arg0, arg1)
{
//
// knd = 0
  var tmpret37
  var tmp38
  var tmp39
  var tmp40
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_qlistref_auxr_6
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab12
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab13
      tmpret37 = arg1;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab14
      case 4: // __atstmplab15
      tmp38 = arg0[0];
      tmp39 = arg0[1];
      tmp40 = _ats2jspre_qlistref_auxr_6(env0, tmp39, arg1);
      tmpret37 = env0[0](env0, tmp40, tmp38);
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret37;
} // end-of-function


function
ats2jspre_qlistref_foldright(arg0, arg1, arg2)
{
//
// knd = 0
  var tmpret44
  var tmp45
  var tmp46
  var tmp55
  var tmp56
  var tmp57
  var tmplab, tmplab_js
//
  // __patsflab_qlistref_foldright
  tmp45 = arg0[0];
  tmp46 = arg0[1];
  tmp55 = ats2jspre_ref_get_elt(tmp46);
  tmp57 = ats2jspre_ref_get_elt(tmp45);
  tmp56 = _ats2jspre_qlistref_auxl_8(arg1, arg2, tmp57);
  tmpret44 = _ats2jspre_qlistref_auxr_9(arg1, tmp55, tmp56);
  return tmpret44;
} // end-of-function


function
_ats2jspre_qlistref_auxl_8(env0, arg0, arg1)
{
//
// knd = 1
  var apy0
  var apy1
  var tmpret47
  var tmp48
  var tmp49
  var tmp50
  var funlab_js
  var tmplab, tmplab_js
//
  while(true) {
    funlab_js = 0;
    // __patsflab__ats2jspre_qlistref_auxl_8
    // ATScaseofseq_beg
    tmplab_js = 1;
    while(true) {
      tmplab = tmplab_js; tmplab_js = 0;
      switch(tmplab) {
        // ATSbranchseq_beg
        case 1: // __atstmplab16
        if(ATSCKptriscons(arg1)) { tmplab_js = 4; break; }
        case 2: // __atstmplab17
        tmpret47 = arg0;
        break;
        // ATSbranchseq_end
        // ATSbranchseq_beg
        case 3: // __atstmplab18
        case 4: // __atstmplab19
        tmp48 = arg1[0];
        tmp49 = arg1[1];
        tmp50 = env0[0](env0, tmp48, arg0);
        // ATStailcalseq_beg
        apy0 = tmp50;
        apy1 = tmp49;
        arg0 = apy0;
        arg1 = apy1;
        funlab_js = 1; // __patsflab__ats2jspre_qlistref_auxl_8
        // ATStailcalseq_end
        break;
        // ATSbranchseq_end
      } // end-of-switch
      if (tmplab_js === 0) break;
    } // endwhile
    // ATScaseofseq_end
    if (funlab_js > 0) continue; else return tmpret47;
  } // endwhile-fun
} // end-of-function


function
_ats2jspre_qlistref_auxr_9(env0, arg0, arg1)
{
//
// knd = 0
  var tmpret51
  var tmp52
  var tmp53
  var tmp54
  var tmplab, tmplab_js
//
  // __patsflab__ats2jspre_qlistref_auxr_9
  // ATScaseofseq_beg
  tmplab_js = 1;
  while(true) {
    tmplab = tmplab_js; tmplab_js = 0;
    switch(tmplab) {
      // ATSbranchseq_beg
      case 1: // __atstmplab20
      if(ATSCKptriscons(arg0)) { tmplab_js = 4; break; }
      case 2: // __atstmplab21
      tmpret51 = arg1;
      break;
      // ATSbranchseq_end
      // ATSbranchseq_beg
      case 3: // __atstmplab22
      case 4: // __atstmplab23
      tmp52 = arg0[0];
      tmp53 = arg0[1];
      tmp54 = _ats2jspre_qlistref_auxr_9(env0, tmp53, arg1);
      tmpret51 = env0[0](env0, tmp52, tmp54);
      break;
      // ATSbranchseq_end
    } // end-of-switch
    if (tmplab_js === 0) break;
  } // endwhile
  // ATScaseofseq_end
  return tmpret51;
} // end-of-function


/* ****** ****** */

/* end-of-compilation-unit */
