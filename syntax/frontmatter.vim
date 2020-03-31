" implement highlighting for https://dev.to/p/editor_guide
syntax region frontmatter
  \ start=/\%1l^---$/ end=/^---$/ contains=@spell,frontmatterKeyword
syntax keyword frontmatterKeyword
  \ title
  \ published
  \ description
  \ tags
  \ canonical_url
  \ cover_image
  \ series
highlight link frontmatterKeyword Keyword

" Do not leave a blank line after --- or prettier will not recognise the front
" matter: https://prettier.io/blog/2018/07/29/1.14.0.html
