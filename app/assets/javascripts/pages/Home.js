const Home = {
    render : async () => {
        let view =  `
            <section class="section">
                <h1>Hello, HR Manager JavaScript!</h1>
            </section>
        `
        return view
    },
    after_render: async () => {
    	console.log("Ok! ok! Home page loaded.")
    }
}