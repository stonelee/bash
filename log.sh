#git log --pretty=format:'%ai %s' --since="2013-09-06" --author="stonelee" --reverse

if [ $# -ne 1 ]; then
  echo "Usage: $0 {startDate:09-06}"
  echo "show git log since start date"
  exit 1
fi

CURRENT=`pwd`
START=$1
LOGFILE=$CURRENT/temp-log

gitLog() {
  cd $1

  echo $1 >> $LOGFILE
  git log --pretty=format:'%ai %s' --since="2013-"$2 --author="stonelee" --reverse >> $LOGFILE
  echo '\n-------------------------------------' >> $LOGFILE

  cd $CURRENT
}

groupGitLog() {
  for d in $1/*
  do
    if [ -d $d ]; then
      gitLog $d $2
    fi
  done
}

gitLog svg $START
gitLog svg-kj83 $START
gitLog svg-network $START
gitLog node-webkit-kj83 $START

gitLog ace $START
gitLog spimp $START
groupGitLog ikj $START

cat $LOGFILE
rm $LOGFILE
