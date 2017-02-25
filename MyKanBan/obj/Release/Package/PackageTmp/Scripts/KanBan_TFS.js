var KanBan_TFS = {
    'CUR_ID': 1,
    'UnselectAllQuery': function () {
        var arr = document.getElementsByName("TFSQuery");
        var obj;
        for (var i = 0; i < arr.length; i++) {
            obj = arr[i];
            obj.className = "Query";
        }
    },
    'SelectQuery': function (id, cur) {
        if (id != KanBan_TFS.CUR_ID) {
            KanBan_TFS.CUR_ID = id;
            KanBan_TFS.UnselectAllQuery();
            KanBan_TFS.UnselectAllButton();
            cur.className = "Query_Sel";
        }
    },
    'UnselectAllButton': function () {
        var arr = document.getElementsByName("ActionButton");
        var obj;
        for (var i = 0; i < arr.length; i++) {
            obj = arr[i];
            obj.className = "tfs_button";
        }
    },
    'SelectButton': function (type, cur) {
        KanBan_TFS.UnselectAllButton();
        cur.className = "tfs_button_sel";
    }
}