import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure ElasticityPackage where
  strainTensor : Type u
  stressTensor : Type v
  elasticModuli : Prop
  constitutiveLaw : Prop
  compatibilityConditions : Prop
  equilibriumEquations : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  elasticModuliClosed : E.elasticModuli
  constitutiveLawClosed : E.constitutiveLaw
  compatibilityConditionsClosed : E.compatibilityConditions
  equilibriumEquationsClosed : E.equilibriumEquations

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.elasticModuli ∧ E.constitutiveLaw ∧ E.compatibilityConditions ∧ E.equilibriumEquations

theorem elasticity_closed_from_evidence (E : ElasticityPackage) (Ev : ElasticityEvidence E) :
  ElasticityClosed E := by
  exact And.intro Ev.elasticModuliClosed (And.intro Ev.constitutiveLawClosed (And.intro Ev.compatibilityConditionsClosed Ev.equilibriumEquationsClosed))

end MaterialsBiomaterialsTheoremCanonicalLaneLean
end HautevilleHouse
