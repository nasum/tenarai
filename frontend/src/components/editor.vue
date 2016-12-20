<template>
<form class="new_article" id="new_article" action="/articles" accept-charset="UTF-8" method="post">
  <input name="utf8" type="hidden" value="✓">
  <div class="form-group">
    <input class="form-control" type="text" name="article[title]" id="article_title">
  </div>
  <div class="form-group">
    <textarea rows="20" class="form-control article-editor" name="article[content]" id="article_content"></textarea>
  </div>
  <div class="actions">
    <input type="submit" name="commit" value="Create" class="btn btn-primary" data-disable-with="Create">
  </div>
</form>
</template>

<script>
export default {
  data (){
    return {
      
    }
  }
}
</script>

<style lang="sass" scoped>
</style>
