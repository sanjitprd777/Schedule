const New = {
    render : async () => {
        let view =  `
            <section class="section">
                <h1> Home </h1>
                <button id="myBtn"> Button</button>
            </section>
        `
        return view
    },
    after_render: async () => {
        document.getElementById("myBtn").addEventListener ("click",  () => {
            console.log('Yo')
            alert('Yo')
        })
    }
}

