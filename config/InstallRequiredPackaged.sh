clear

until read -r -p "Destination Org (e.g., UAT): " destinationOrg && test "$destinationOrg" != ""; do
  continue
done

echo "Install required Packaged in $destinationOrg."
echo "Installing DocuSign Apps Launcher..."
sf package install --package 04t3u000002wLcpAAE --target-org "$destinationOrg" -w 15 -r
echo "Installing Time Warp..."
sf package install --package 04t2w000008K32CAAS --target-org "$destinationOrg" -w 15 -r
echo "Installing CMTD Enhanced Related List..."
sf package install --package 04t6F000004DIrEQAW --target-org "$destinationOrg" -w 15 -r
echo "Installing Declarative Lookup Rollup Summaries Tool..."
sf package install --package 04t5p000001BmLvAAK --target-org "$destinationOrg" -w 15 -r
echo "Installing FlowActionsBasePack..."
sf package install --package 04t8b000000mL43AAE --target-org "$destinationOrg" -w 15 -r
echo "Installing FlowScreenComponentsBasePack..."
sf package install --package 04t5G0000043xsbQAA --target-org "$destinationOrg" -w 15 -r
echo "Installing Send Email..."
sf package install --package 04t0o000002qOIyAAM --target-org "$destinationOrg" -w 15 -r
echo "Installing Enhanced Files List..."
sf package install --package 04t5w000005b2U4AAI --target-org "$destinationOrg" -w 15 -r
echo "Installing LightningSharing..."
sf package install --package 04t4p000002BZuxAAG --target-org "$destinationOrg" -w 15 -r
echo "Installing CollectionActionsL..."
sf package install --package 04t5G0000043wsMQAQ --target-org "$destinationOrg" -w 15 -r
echo "Installing Flow Modal..."
sf package install --package 04t2E000003VsuMQAS --target-org "$destinationOrg" -w 15 -r

