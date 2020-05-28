const Navbar = {
  render : async () => {
      let view =  `
        <div id="header_container">
          <nav class="navbar navbar-default sticky-top">
              <div class="collapse navbar-collapse" id="bs-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                    <a class="navbar-item" href = "/#/">
                      Home
                    </a>
                    </li>
                    <li>
                    <a class="navbar-item" href = "/#/interviews/">
                      Interviews
                    </a>
                    <li>
                    <a class="navbar-item" href = "/#/interviews/new/">
                      New
                    </a>
                    </li>
                </ul>
              </div>
          </nav>
        </div>
      `
      return view
  },
  after_render: async () => { }
}

