window.addEventListener('load', onLoadEvent);
    
    var tag = document.createElement('script');
    tag.src = "https://www.youtube.com/player_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
    
    var player;
    function makeYoutube(getYTLink) {
        player = new YT.Player('ytplayer', {
        height: '100%',
        width: '100%',
        videoId: getYTLink,
        playerVars : {
            'controls': 0, //플레이어 컨드롤러 표시여부
            'rel': 0, //연관동영상 표시여부
            'playsinline': 0, //ios환경에서 전체화면으로 재생하지 않게하는 옵션
            'autoplay': 1, //자동재생 여부(모바일에서 작동하지 않습니다. mute설정을 하면 작동합니다.)
            'loop': 0,
            'mute' : 1,
            'rel' : 0,
            'cc_load_policy' : 0
        },
        events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
        }
        });
        
        function onPlayerReady(event) {
            event.target.playVideo();
        }

        function onPlayerStateChange(event) {
            if (event.data === 0) {
                $('#ytplayer').hide();
            }
        }
    }
    
    function youtubeLink() {
    	var getYT = $("#ytWrap").data('link').split('?');
        var getYTSplit = getYT[0].split('/');
        var getYTLink = getYTSplit[4];

        makeYoutube(getYTLink);
    }

    function onLoadEvent() {
        youtubeLink();
    }