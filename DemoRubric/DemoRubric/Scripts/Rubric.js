

window.sumInputs = function () {
    var inputs = document.getElementsByName('Marks'),
        result = document.getElementById('total'),
        sum = 0;

    for (var i = 0; i < inputs.length; i++) {
        var ip = inputs[i];

        if (ip.name && ip.name.indexOf("total") < 0) {
            sum += parseInt(ip.value) || 0;
        }

    }

    result.value = sum;
}
function check1(el) {
    var cbox = document.getElementsByName("checkbox");
    cbox.forEach(function (item) {
        if (item != el)
            item.checked = false;
    });
}  
function check2(el) {
    var cbox = document.getElementsByName("checkbox");
    cbox.forEach(function (item) {
        if (item != el)
            item.checked = false;
    });
} 
function check3(el) {
    var cbox = document.getElementsByName("checkbox");
    cbox.forEach(function (item) {
        if (item != el)
            item.checked = false;
    });
} 
function check4(el) {
    var cbox = document.getElementsByName("checkbox");
    cbox.forEach(function (item) {
        if (item != el)
            item.checked = false;
    });
} 
function check5(el) {
    var cbox = document.getElementsByName("checkbox");
    cbox.forEach(function (item) {
        if (item != el)
            item.checked = false;
    });
}
function check6(el) {
    var cbox = document.getElementsByName("checkbox");
    cbox.forEach(function (item) {
        if (item != el)
            item.checked = false;
    });
}
function check7(el) {
    var cbox = document.getElementsByName("checkbox");
    cbox.forEach(function (item) {
        if (item != el)
            item.checked = false;
    });
} 
function check8(el) {
    var cbox = document.getElementsByName("checkbox");
    cbox.forEach(function (item) {
        if (item != el)
            item.checked = false;
    });
} 
function check9(el) {
    var cbox = document.getElementsByName("checkbox");
    cbox.forEach(function (item) {
        if (item != el)
            item.checked = false;
    });
} 
function check10(el) {
    var cbox = document.getElementsByName("checkbox");
    cbox.forEach(function (item) {
        if (item != el)
            item.checked = false;
    });
} 

function EnableDisableTextBox1(chk) {
    var t1 = document.getElementById("imp1");
    var t2 = document.getElementById("str1");
    var t3 = document.getElementById("m1");
    t1.disabled = chk.checked ? false : true;
    t2.disabled = chk.checked ? false : true;
    t3.disabled = chk.checked ? false : true;
    if (!t1.disabled) {
        t1.focus();
    }
    if (!t2.disabled) {
        t2.focus();
    }
    if (!t3.disabled) {
        t3.focus();
    }

}

function EnableDisableTextBox2(chk) {
    var t1 = document.getElementById("imp2");
    var t2 = document.getElementById("str2");
    var t3 = document.getElementById("m2");
    t1.disabled = chk.checked ? false : true;
    t2.disabled = chk.checked ? false : true;
    t3.disabled = chk.checked ? false : true;
    if (!t1.disabled) {
        t1.focus();
    }
    if (!t2.disabled) {
        t2.focus();
    }
    if (!t3.disabled) {
        t3.focus();
    }

}

function EnableDisableTextBox3(chk) {
    var t1 = document.getElementById("imp3");
    var t2 = document.getElementById("str3");
    var t3 = document.getElementById("m3");
    t1.disabled = chk.checked ? false : true;
    t2.disabled = chk.checked ? false : true;
    t3.disabled = chk.checked ? false : true;
    if (!t1.disabled) {
        t1.focus();
    }
    if (!t2.disabled) {
        t2.focus();
    }
    if (!t3.disabled) {
        t3.focus();
    }

}

function EnableDisableTextBox4(chk) {
    var t1 = document.getElementById("imp4");
    var t2 = document.getElementById("str4");
    var t3 = document.getElementById("m4");
    t1.disabled = chk.checked ? false : true;
    t2.disabled = chk.checked ? false : true;
    t3.disabled = chk.checked ? false : true;
    if (!t1.disabled) {
        t1.focus();
    }
    if (!t2.disabled) {
        t2.focus();
    }
    if (!t3.disabled) {
        t3.focus();
    }

}

function EnableDisableTextBox5(chk) {
    var t1 = document.getElementById("imp5");
    var t2 = document.getElementById("str5");
    var t3 = document.getElementById("m5");
    t1.disabled = chk.checked ? false : true;
    t2.disabled = chk.checked ? false : true;
    t3.disabled = chk.checked ? false : true;
    if (!t1.disabled) {
        t1.focus();
    }
    if (!t2.disabled) {
        t2.focus();
    }
    if (!t3.disabled) {
        t3.focus();
    }

}

function EnableDisableTextBox6(chk) {
    var t1 = document.getElementById("imp6");
    var t2 = document.getElementById("str6");
    var t3 = document.getElementById("m6");
    t1.disabled = chk.checked ? false : true;
    t2.disabled = chk.checked ? false : true;
    t3.disabled = chk.checked ? false : true;
    if (!t1.disabled) {
        t1.focus();
    }
    if (!t2.disabled) {
        t2.focus();
    }
    if (!t3.disabled) {
        t3.focus();
    }

}

function EnableDisableTextBox7(chk) {
    var t1 = document.getElementById("imp7");
    var t2 = document.getElementById("str7");
    var t3 = document.getElementById("m7");
    t1.disabled = chk.checked ? false : true;
    t2.disabled = chk.checked ? false : true;
    t3.disabled = chk.checked ? false : true;
    if (!t1.disabled) {
        t1.focus();
    }
    if (!t2.disabled) {
        t2.focus();
    }
    if (!t3.disabled) {
        t3.focus();
    }

}

function EnableDisableTextBox8(chk) {
    var t1 = document.getElementById("imp8");
    var t2 = document.getElementById("str8");
    var t3 = document.getElementById("m8");
    t1.disabled = chk.checked ? false : true;
    t2.disabled = chk.checked ? false : true;
    t3.disabled = chk.checked ? false : true;
    if (!t1.disabled) {
        t1.focus();
    }
    if (!t2.disabled) {
        t2.focus();
    }
    if (!t3.disabled) {
        t3.focus();
    }

}

function EnableDisableTextBox9(chk) {
    var t1 = document.getElementById("imp9");
    var t2 = document.getElementById("str9");
    var t3 = document.getElementById("m9");
    t1.disabled = chk.checked ? false : true;
    t2.disabled = chk.checked ? false : true;
    t3.disabled = chk.checked ? false : true;
    if (!t1.disabled) {
        t1.focus();
    }
    if (!t2.disabled) {
        t2.focus();
    }
    if (!t3.disabled) {
        t3.focus();
    }

}

function EnableDisableTextBox10(chk) {
    var t1 = document.getElementById("imp10");
    var t2 = document.getElementById("str10");
    var t3 = document.getElementById("m10");
    t1.disabled = chk.checked ? false : true;
    t2.disabled = chk.checked ? false : true;
    t3.disabled = chk.checked ? false : true;
    if (!t1.disabled) {
        t1.focus();
    }
    if (!t2.disabled) {
        t2.focus();
    }
    if (!t3.disabled) {
        t3.focus();
    }

}
