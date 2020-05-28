const Error404 = {
    render : async () => {
        let view =  `
            <section class="section">
                <h1> 404, Page doesnot exists. </h1>
            </section>
        `
        return view
    },
    after_render: async () => {
    }
}

