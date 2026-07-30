import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure MaterialsAdmittedObject where
  crystalStructure : String
  elasticTensor : Type
  fractureToughness : Float
  biocompatibilityPass : Prop
  conclusion : biocompatibilityPass

structure AdmissibleClass where
  object : MaterialsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse