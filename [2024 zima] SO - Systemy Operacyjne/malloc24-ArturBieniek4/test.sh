for f in traces/*.rep; do
    echo "Testing $f..."
    ./mdriver -D -f $f
    if [ $? -ne 0 ]; then
        echo "Error occurred, exiting loop."
        break
    fi
done
