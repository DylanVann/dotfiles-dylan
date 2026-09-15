function add-subtitles --description "add-subtitles <video> <subtitle> <output>"
  ffmpeg -i $argv[1] -i $argv[2] -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s mov_text $argv[3]
end

# ffmpeg -i Succession.S01E05.1080p.BluRay.x265-RARBG.mp4 -i Succession.S01E05.1080p.BluRay.x265-RARBG/2_English.srt -c copy -c:s mov_text Succession.S01E05.1080p.BluRay.x265-RARBG_subbed.mp4
# ffmpeg -i Succession.S01E05.1080p.BluRay.x265-RARBG.mp4 -i Succession.S01E05.1080p.BluRay.x265-RARBG/2_English.srt -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s mov_text Succession.S01E05.1080p.BluRay.x265-RARBG_subbed.mp4