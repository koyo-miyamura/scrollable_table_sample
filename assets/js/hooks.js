let Hooks = {}

// Returns scroll rate [%] of scrollable area for target DOM (el).
const scrollAt = (el) => {
  const scrollTop = el.scrollTop
  const scrollHeight = el.scrollHeight
  const clientHeight = el.clientHeight

  const result = scrollTop / (scrollHeight - clientHeight) * 100

  return result
}

Hooks.InfiniteScroll = {
  page() { return parseInt(this.el.dataset.page, 10) },
  total_pages() { return this.el.dataset.total_pages },
  mounted() {
    this.loading = false

    const $scrollDiv = document.querySelector(this.el.dataset.el)
    $scrollDiv.addEventListener("scroll", _e => {
      if(!this.loading && this.page() != this.total_pages() && scrollAt($scrollDiv) >= 99){
        // change "loading" into true in order to prevent multiple page loading at once
        this.loading = true
        this.pushEventTo("#" + this.el.id, "load_more", {})
      }
    })
  },
  reconnected(){ this.loading = false },
  updated(){ this.loading = false }
}

export { Hooks }
